import 'package:flutter/material.dart';

class WithdrawView extends StatelessWidget {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Withdraw View'),
      ),
      body: const Center(
        child: Text('Withdraw your points as cash '),
      ),
    );
  }
}
