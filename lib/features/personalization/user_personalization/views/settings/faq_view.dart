import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/common/styles/custom_layout_with_scroll_padding.dart';
import 'package:petrecycler/common/widgets/custom_app_bar.dart';
import 'package:petrecycler/features/personalization/user_personalization/controllers/faq_controller.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FaqController());
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Frequently Asked Questions'),
      ),
      body: CustomLayoutWithScrollAndPadding(
        child: Obx(
          () => ExpansionPanelList(
            expandedHeaderPadding: const EdgeInsets.all(0),
            expansionCallback: (index, isExpanded){
              final tile = controller.allFaqs[index];
              controller.expandPanelCon(tile.expand);
            },
            children: controller.allFaqs.map(
              (e) {
                return ExpansionPanel(
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
                  isExpanded: controller.isExpanded.value,
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
