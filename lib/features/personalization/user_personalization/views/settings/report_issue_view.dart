import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';
import '../widgets/custom_report_issue_form.dart';

class ReportIssueView extends StatelessWidget {
  const ReportIssueView({super.key});

  @override
  Widget build(BuildContext context) {
    
    //
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Report Issues',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        showCenterTitle: true,
      ),
      body: const CustomLayoutWithScrollAndPadding(
        child: CustomReportIssueForm(),
      ),
    );
  }
}
