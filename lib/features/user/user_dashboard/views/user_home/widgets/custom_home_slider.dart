import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';
import 'package:petrecycler/features/user/user_dashboard/controllers/slider_controller.dart';
import 'package:petrecycler/utilities/constants/colors.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';

class CustomHomeSlider extends StatelessWidget {
  const CustomHomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SliderController());

    return Obx(
      () => Column(
        children: [
          CarouselSlider(
            items: controller.banners
                .map(
                  (e) => Image(
                    fit: BoxFit.contain,
                    image: AssetImage(e),
                  ),
                )
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: true,
                initialPage: controller.sliderValue.value,
                onPageChanged: (index, _) => {controller.onPageChange(index)}),
          ),
          const SizedBox(height: CSizes.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < controller.banners.length; ++i)
                CustomRoundedContainer(
                  height: 4,
                  width: 20,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.sliderValue.value == i
                      ? CColors.primary
                      : Colors.grey.withOpacity(0.2),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
