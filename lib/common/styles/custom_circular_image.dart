import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/shimmers/custom_shimmer_effect.dart';


class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.paddingSize = CSizes.sm,
    this.boxFit,
    required this.imageUrl,
    this.isNetworkImage = false,
    this.overLayColor,
    this.backgroundColor,
  });
  final double width, height, paddingSize;
  final BoxFit? boxFit;
  final String imageUrl;
  final bool isNetworkImage;
  final Color? overLayColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
 

    //
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(paddingSize),
      decoration: BoxDecoration(
          color: backgroundColor ?? CColors.white,
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: boxFit,
                  color: overLayColor,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const CustomShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(imageUrl),
                  color: overLayColor,
                  fit: boxFit,
                ),
        ),
      ),
    );
  }
}
