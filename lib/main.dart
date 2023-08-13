import 'package:employee_list/app/app.dart';
import 'package:employee_list/bootstrap.dart';
import 'package:employee_list/features/employee/models/employee_model.dart';
import 'package:employee_list/features/employee/models/employee_role.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const employeesBox = 'employee_box';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive
    ..registerAdapter<EmployeeRole>(EmployeeRoleAdapter())
    ..registerAdapter<EmployeeModel>(EmployeeModelAdapter());

  await Hive.openBox<EmployeeModel>(employeesBox);

  await bootstrap(() => const App());
}
