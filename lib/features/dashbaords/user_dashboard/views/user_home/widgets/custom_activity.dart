import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';

class CustomActivity extends StatelessWidget {
  const CustomActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.wash_outlined),
      title: Text('Request completed'),
      subtitle: Text('pickup date set'),
      isThreeLine: true,
      enableFeedback: false,
      trailing: CustomRoundedContainer(
        backgroundColor: Colors.green,
        width: 15,
        height: 15,
        radius: 40,
      ),
    );
  }
}
