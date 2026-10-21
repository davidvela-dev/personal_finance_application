import 'package:flutter/material.dart';

import 'constants/routes.dart';

import 'views/login.dart';
import 'views/register.dart';
import 'views/home.dart';
import 'views/movements.dart';
import 'views/edit.dart';
import 'views/budgets.dart';
import 'views/reports.dart';
import 'views/alerts.dart';
import 'views/categories.dart';
import 'views/statements.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.login,

      // dictionary of named routes
      routes: {
        Routes.login: (context) => const LoginView(),
        Routes.register: (context) => const RegisterView(),
        Routes.home: (context) => const HomeView(),
        Routes.movements: (context) => const MovementsView(),
        Routes.edit: (context) => const EditView(),
        Routes.budgets: (context) => const BudgetsView(),
        Routes.reports: (context) => const ReportsView(),
        Routes.alerts: (context) => const AlertsView(),
        Routes.categories: (context) => const CategoriesView(),
        Routes.statements: (context) => const StatementsView(),
      },
    );
  }
}
