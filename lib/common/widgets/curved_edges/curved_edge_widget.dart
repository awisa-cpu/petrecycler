import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/curved_edges/custom_curved_clipper_path.dart';

class CustomCurvedEdgeWidget extends StatelessWidget {
  const CustomCurvedEdgeWidget({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedClipperPath(), child: child);
  }
}
