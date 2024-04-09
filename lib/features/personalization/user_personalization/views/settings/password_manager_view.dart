import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';

class PasswordManagerView extends StatelessWidget {
  const PasswordManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Password Manager'),
      ),
    );
  }
}