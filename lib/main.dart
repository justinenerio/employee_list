import 'package:employee_list/app/app.dart';
import 'package:employee_list/bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootstrap(() => const App());
}
