import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/buttons/custom_icon_button.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/device_utility/device_utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final Widget? image;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool  showCenterTitle;

  const CustomAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed,
      this.image,  this.showCenterTitle =false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CSizes.sm),
      child: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? CustomIconButton(
                action: () => Get.back(),
                icon: Icons.arrow_back,
                iconColor: Colors.black,
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : image,
        title: title,
        actions: actions,
        centerTitle: showCenterTitle,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CDeviceUtility.getAppBarHeight());
}
