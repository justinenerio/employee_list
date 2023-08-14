import 'package:employee_list/data/db.dart';
import 'package:employee_list/features/employee/screens/employee_list_screen.dart';
import 'package:employee_list/features/employee/services/repository.dart';
import 'package:employee_list/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => EmployeeRepository(Hive.box(employeesBox)),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF1DA1F2)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF1DA1F2),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const EmployeeListScreen(),
      ),
    );
  }
}
