import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/widget_auth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // controllers to handle register form inputs
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _acceptTerms = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // sign up method using firebase auth
  Future<void> _signUp() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Please fill in all required fields');
      return;
    }

    if (password != _confirmPasswordController.text.trim()) {
      _showMessage('Passwords do not match');
      return;
    }

    if (!_acceptTerms) {
      _showMessage('Please accept the privacy policy');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // update display name in firebase user profile
      if (name.isNotEmpty) await userCredential.user?.updateDisplayName(name);

      // redirect to login or home
      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (mounted) _showMessage(e.message ?? 'Registration failed');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF3B7A66);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // navigation header with back button
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // title
              const Text(
                'Start with calm.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              // subtitle
              const Text(
                'The first step to knowing your finances.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // full name input
              WidgetAuth(controller: _nameController, hint: 'Full name'),
              const SizedBox(height: 14),

              // email input
              WidgetAuth(
                controller: _emailController,
                hint: 'Email address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),

              // password input
              WidgetAuth(
                controller: _passwordController,
                hint: 'Password',
                obscureText: true,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 10.0),
                child: Text(
                  'At least 6 characters',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ),

              // confirm password input
              WidgetAuth(
                controller: _confirmPasswordController,
                hint: 'Confirm password',
                obscureText: true,
              ),
              const SizedBox(height: 14),

              // privacy policy checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'I accept the privacy policy',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Checkbox(
                    value: _acceptTerms,
                    activeColor: primaryColor,
                    onChanged: (val) =>
                        setState(() => _acceptTerms = val ?? false),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // signup button
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                  child: const Text(
                    'Create my account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
