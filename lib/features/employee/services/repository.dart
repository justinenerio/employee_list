import 'package:employee_list/features/employee/models/employee_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EmployeeRepository {
  EmployeeRepository(this.db);

  final Box<EmployeeModel> db;

  Future<void> addEmployee(EmployeeModel employee) async {
    await db.put(employee.id, employee);
  }

  Future<void> deleteEmployee(String id) async {
    await db.delete(id);
  }

  Future<void> updateEmployee(EmployeeModel employee) async {
    await db.put(employee.id, employee);
  }
}
