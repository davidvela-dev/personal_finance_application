import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'views/login.dart';
import 'views/views_layout.dart';

// widget that manages what screen to show depending on the authentication
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance
          .authStateChanges(), // stream to hear auth events
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()), // loader
          );
        }

        return snapshot.hasData
            ? const ViewsLayout()
            : const LoginView(); // show home or login screen
      },
    );
  }
}
