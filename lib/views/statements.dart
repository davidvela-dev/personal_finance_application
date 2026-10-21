import 'package:flutter/material.dart';

class StatementsView extends StatelessWidget {
  const StatementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statements')),
      body: const Center(child: Text('Statements Screen Content')),
    );
  }
}
