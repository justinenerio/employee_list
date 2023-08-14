import 'package:employee_list/features/employee/models/employee_model.dart';
import 'package:employee_list/features/employee/models/employee_role.dart';
import 'package:hive_flutter/hive_flutter.dart';

const employeesBox = 'employee_box';

Future<void> initDb() async {
  await Hive.initFlutter();

  Hive
    ..registerAdapter<EmployeeRole>(EmployeeRoleAdapter())
    ..registerAdapter<EmployeeModel>(EmployeeModelAdapter());

  await Hive.openBox<EmployeeModel>(employeesBox);
}
