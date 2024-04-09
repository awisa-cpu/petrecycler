import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/curved_edges/curved_edge_widget.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class CustomPrimaryHeaderContainer extends StatelessWidget {
  const CustomPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgeWidget(
      child: Container(
        color: CColors.mainColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -200,
              child: CustomRoundedContainer(
                width: 400,
                height: 400,
                radius: 400,
                backgroundColor: CColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -250,
              child: CustomRoundedContainer(
                width: 400,
                height: 400,
                radius: 400,
                backgroundColor: CColors.textWhite.withOpacity(0.1),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
