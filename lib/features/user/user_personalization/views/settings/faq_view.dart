import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';
import 'package:petrecycler/features/user/user_personalization/controllers/user_settings_controller.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserSettingsController());

    //
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Frequently Asked Questions'),
        showCenterTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => ExpansionPanelList(
            expandedHeaderPadding: const EdgeInsets.all(0),
            expansionCallback: controller.expandPanelCon,
            children: controller.allFaqs.map(
              (e) {
                return ExpansionPanel(
                  backgroundColor: Colors.white,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        e.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                  body: ListTile(
                    title: Text(e.body),
                  ),
                  isExpanded: controller.tile.value.isExpanded,
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
