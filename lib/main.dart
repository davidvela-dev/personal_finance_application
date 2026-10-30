import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'auth_gate.dart'; // manager of auth
import 'constants/routes.dart';

import 'viewmodels/provider_category.dart'; // provider for widgets available to all screens

import 'views/login.dart';
import 'views/register.dart';
import 'views/edit.dart';
import 'views/alerts.dart';
import 'views/categories.dart';
import 'views/statements.dart';

import 'views/views_layout.dart'; // imports home, movements, budgets and reports screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ensure inicialization of bindings before executing code

  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp()); // index root widget MyApp to the visual interface
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // constructor of root widget

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // provider initialized
      create: (context) => CategoryProvider(),

      child: MaterialApp(
        // base widget with routes and services
        debugShowCheckedModeBanner: false,

        home: const AuthGate(), // authgate decides between login and home
        // dictionary of named routes
        routes: {
          Routes.login: (context) => const LoginView(),
          Routes.register: (context) => const RegisterView(),

          // screens of same layout with different index as parameter
          Routes.home: (context) => const ViewsLayout(initialIndex: 0),
          Routes.movements: (context) => const ViewsLayout(initialIndex: 1),
          Routes.budgets: (context) => const ViewsLayout(initialIndex: 2),
          Routes.reports: (context) => const ViewsLayout(initialIndex: 3),

          Routes.edit: (context) => const EditView(),
          Routes.alerts: (context) => const AlertsView(),
          Routes.categories: (context) => const CategoriesView(),
          Routes.statements: (context) => const StatementsView(),
        },
      ),
    );
  }
}
