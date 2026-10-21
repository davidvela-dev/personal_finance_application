import 'package:flutter/material.dart';

import 'constants/routes.dart';

import 'views/login.dart';
import 'views/register.dart';
import 'views/edit.dart';
import 'views/alerts.dart';
import 'views/categories.dart';
import 'views/statements.dart';

import 'views/views_layout.dart'; // imports home, movements, budgets and reports screen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: Routes.home,

      // dictionary of named routes
      routes: {
        Routes.login: (context) => const LoginView(),
        Routes.register: (context) => const RegisterView(),

        Routes.home: (context) => const LayoutView(), // loads 4 dinamic screens with bottom nav bar

        Routes.edit: (context) => const EditView(),
        Routes.alerts: (context) => const AlertsView(),
        Routes.categories: (context) => const CategoriesView(),
        Routes.statements: (context) => const StatementsView(),
      },
    );
  }
}
