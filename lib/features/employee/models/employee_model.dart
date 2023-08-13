import 'package:employee_list/features/employee/models/employee_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
class EmployeeModel with _$EmployeeModel {
  @HiveType(typeId: 0)
  const factory EmployeeModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required EmployeeRole role,
    @HiveField(3) required DateTime startDate,
    @HiveField(4) DateTime? endDate,
  }) = _EmployeeModel;

  const EmployeeModel._();

  bool get isActive => endDate == null;
}

extension EmployeeModelX on List<EmployeeModel> {
  List<EmployeeModel> get activeEmployees =>
      where((employee) => employee.isActive).toList();

  List<EmployeeModel> get inactiveEmployees =>
      where((employee) => !employee.isActive).toList();
}
