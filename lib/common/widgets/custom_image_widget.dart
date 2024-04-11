import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/shimmers/custom_shimmer_effect.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    this.profileImage,
    this.isNetWorkImage = false,
    this.height = 40,
    this.width = 40,
  });

  final String? profileImage;
  final bool isNetWorkImage;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return isNetWorkImage
        ? Container(
            height: height,
            width: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: profileImage!,
                errorWidget: (_, url, error) => const Icon(Icons.person),
                progressIndicatorBuilder: (_, url, progress) =>
                    const CustomShimmerEffect(
                  width: double.infinity,
                  height: 190,
                ),
              ),
            ),
          )
        : CircleAvatar(
            radius: 40,
            backgroundColor: CColors.mainColor,
            child: CircleAvatar(
              backgroundImage: AssetImage(profileImage ?? CImages.userProfile),
              radius: 35,
            ),
          );
  }
}
