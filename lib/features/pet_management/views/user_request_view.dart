import 'package:flutter/material.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/curved_edges/curved_edge_widget.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/constants/texts.dart';
import 'widgets/custom_pet_request_form.dart';
import 'widgets/custom_request_title_with_icon.dart';

class UserRequestView extends StatelessWidget {
  const UserRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //section 1
            CustomCurvedEdgeWidget(
              child: Container(
                height: 105,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(CImages.requestBackground),
                  ),
                ),
              ),
            ),

            //section 2
            CustomLayoutWithScrollAndPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomRequestTitleWithIcon(
                    icon: Icons.recycling,
                    title: 'Pet Bottle Recycling',
                  ),

                  //
                  const SizedBox(height: CSizes.md),

                  Text(
                    CTexts.recycleInstructions,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  //
                  const SizedBox(height: CSizes.lg),

                  //
                  const CustomPetRequestForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
