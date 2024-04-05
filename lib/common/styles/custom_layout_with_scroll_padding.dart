import 'package:flutter/material.dart';

class CustomLayoutWithScrollAndPadding extends StatelessWidget {
  const CustomLayoutWithScrollAndPadding({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: child,
      ),
    );
  }
}
