import 'package:get/get.dart';
import 'package:petrecycler/features/personalization/user_personalization/model/faq_model.dart';

class FaqController extends GetxController {
  static FaqController get instance => Get.find();

  //variables
  final List<FaqModel> allFaqs = [
    FaqModel(
      title: "Can I track my order's status?",
      body:
          'Install Flutter development tools according to the official documentation.',
    ),
    FaqModel(
      title: 'Is there a return policy?',
      body:
          'Open your terminal, run `flutter create <project_name>` to create a new project.',
    ),
    FaqModel(
      title: "Can I save my favourite items for later?",
      body:
          'Change your terminal directory to the project directory, enter `flutter run`.',
    ),
    FaqModel(
      title: "Can I share products with my friends?",
      body:
          'Change your terminal directory to the project directory, enter `flutter run`.',
    ),
    FaqModel(
      title: "How do I contact customer support?",
      body:
          'Change your terminal directory to the project directory, enter `flutter run`.',
    ),
    FaqModel(
      title: "What payment methods are accepted?",
      body:
          'Change your terminal directory to the project directory, enter `flutter run`.',
    ),
    FaqModel(
      title: "How to add review?",
      body:
          'Change your terminal directory to the project directory, enter `flutter run`.',
    ),
  ];
  final RxBool isExpanded = false.obs;

  ///methods
  void expandPanelCon(bool value) {
    isExpanded.value = value;
  }
}
