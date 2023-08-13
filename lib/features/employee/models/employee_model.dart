import 'package:employee_list/features/employee/models/employee_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_model.freezed.dart';
// part 'employee_model.g.dart';

@freezed
class EmployeeModel with _$EmployeeModel {
  const factory EmployeeModel({
    required String name,
    required EmployeeRole role,
    required DateTime startDate,
    DateTime? endDate,
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
