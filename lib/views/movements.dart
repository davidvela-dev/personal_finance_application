import 'package:flutter/material.dart';

class MovementsView extends StatelessWidget {
  const MovementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movements')),
      body: const Center(child: Text('Movements Screen Content')),
    );
  }
}
