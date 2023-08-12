import 'package:employee_list/features/employee/screens/employee_list_screen.dart';
import 'package:employee_list/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF1DA1F2)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF1DA1F2),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const EmployeeListScreen(),
    );
  }
}
