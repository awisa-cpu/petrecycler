import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

import '../widgets/contact_us_form.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Contact us'),
      ),
      body: CustomLayoutWithScrollAndPadding(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Any Questions?', style: Theme.of(context).textTheme.titleLarge),
          Text('We would be happy to help!',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: CSizes.lg),
          const ContactUsForm()
        ],
      )),
    );
  }
}
