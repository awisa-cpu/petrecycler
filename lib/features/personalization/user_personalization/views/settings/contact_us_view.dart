import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/buttons/custom_elevated_button.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

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

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('First Name'),
          const SizedBox(height: CSizes.md),
          TextFormField(
              // decoration:
              // const InputDecoration(hintText: 'Your first name'),
              ),
          const SizedBox(height: CSizes.lg),
          const Text('Last Name'),
          const SizedBox(height: CSizes.md),
          TextFormField(
              // decoration: const InputDecoration(hintText: 'Your Last name'),
              ),
          const SizedBox(height: CSizes.lg),
          const Text('Phone number'),
          const SizedBox(height: CSizes.md),
          TextFormField(
              // decoration: const InputDecoration(hintText: '08128824153'),
              ),
          const SizedBox(height: CSizes.lg),
          const Text('Message'),
          const SizedBox(height: CSizes.md),
          TextFormField(
            maxLines: 6,
            decoration:
                const InputDecoration(hintText: 'Type your message here'),
          ),
          const SizedBox(height: CSizes.lg),
          CustomEButton(
            onPressed: () {},
            text: 'Send Message',
            addIcon: true,
            icon: Iconsax.send1,
          ),
          const SizedBox(height: CSizes.lg)
        ],
      ),
    );
  }
}
