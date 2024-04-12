import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';

class AdminIssuesHelpView extends StatelessWidget {
  const AdminIssuesHelpView({super.key});
//page to handle users issues
  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Issues Help '),
      ),
    );
  }
}