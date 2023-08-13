// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_role.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeRoleAdapter extends TypeAdapter<EmployeeRole> {
  @override
  final int typeId = 1;

  @override
  EmployeeRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EmployeeRole.productDesigner;
      case 1:
        return EmployeeRole.flutterDeveloper;
      case 2:
        return EmployeeRole.qaTester;
      case 3:
        return EmployeeRole.productOwner;
      default:
        return EmployeeRole.productDesigner;
    }
  }

  @override
  void write(BinaryWriter writer, EmployeeRole obj) {
    switch (obj) {
      case EmployeeRole.productDesigner:
        writer.writeByte(0);
        break;
      case EmployeeRole.flutterDeveloper:
        writer.writeByte(1);
        break;
      case EmployeeRole.qaTester:
        writer.writeByte(2);
        break;
      case EmployeeRole.productOwner:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
