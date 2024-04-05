import 'package:flutter/material.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Welcome Home'),
      ),
      body: const Center(child: Text('All home details')),
    );
  }
}
