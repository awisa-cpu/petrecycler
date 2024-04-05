import 'package:flutter/material.dart';

class AdminRequestManager extends StatelessWidget {
  const AdminRequestManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Request Manager'),
      ),
      body: const Center(child: Text('All request details')),
    );
  }
}
