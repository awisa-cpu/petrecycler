import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/shimmers/custom_shimmer_effect.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({
    super.key,
    this.isNetworkImage = false,
    required this.imageUrl,
    this.isAdmin = false,
    this.radius = 80,
    required this.width,
    required this.height,
    this.padding,
   this.backgroundColor= Colors.white,
    this.applyImageRadius = true,
    this.fit = BoxFit.contain,
    this.borderColor = Colors.white,
    this.borderWidth = 0.8,
  });
  final bool isNetworkImage;
  final String imageUrl;
  final bool isAdmin;
  final double radius;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final bool applyImageRadius;
  final BoxFit fit;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(radius)
            : BorderRadius.zero,
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (_, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (_, url, progress) =>
                    const CustomShimmerEffect(
                  width: double.infinity,
                  height: 190,
                ),
              )
            : Image(
                fit: fit,
                image: AssetImage(
                  imageUrl.isNotEmpty
                      ? imageUrl
                      : isAdmin
                          ? CImages.adminProfile
                          : CImages.userProfile,
                ),
              ),
      ),
    );
  }
}
