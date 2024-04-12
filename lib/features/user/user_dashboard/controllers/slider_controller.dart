import 'package:get/get.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';

class SliderController extends GetxController{
  static SliderController get instance => Get.find();

  ///variables
  final RxInt sliderValue = 0.obs;
  final List<String> banners =[
    CImages.banner1,
    CImages.banner2,
    CImages.banner3,
  ];


  void onPageChange(int value){
    sliderValue.value = value;
  }


}