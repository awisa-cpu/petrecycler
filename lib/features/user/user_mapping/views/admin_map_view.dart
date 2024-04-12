import 'package:flutter/material.dart';

class AdminMapView extends StatelessWidget {
  const AdminMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Welcome To Map View'),
      ),
      body: const Center(child: Text('Map View details')),
    );
  }
}
