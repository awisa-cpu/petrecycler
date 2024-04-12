import 'package:flutter/material.dart';

class UserMapView extends StatelessWidget {
  const UserMapView({super.key});

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
