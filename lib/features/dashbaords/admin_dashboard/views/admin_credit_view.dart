import 'package:flutter/material.dart';

class AdminCreditView extends StatelessWidget {
  const AdminCreditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin Credit'),
      ),
      body: const Center(child: Text('Credit users')),
    );
  }
}
