import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';

class ReportIssueView
 extends StatelessWidget {
  const ReportIssueView
  ({super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Report Issues'),
      ),
    );
  }
}