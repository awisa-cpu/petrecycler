import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';

class CustomActivity extends StatelessWidget {
  const CustomActivity({
    super.key,
    required this.title,
    required this.subTitle,
    this.leading,
    this.trailing, this.backgroundColor,
  });
  final String title;
  final String subTitle;
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading ?? const Icon(Icons.wash_outlined),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .apply(overflow: TextOverflow.ellipsis),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(overflow: TextOverflow.ellipsis),
      ),
      isThreeLine: true,
      enableFeedback: false,
      trailing: trailing ??
        CustomRoundedContainer(
            backgroundColor: backgroundColor??Colors.green,
            width: 15,
            height: 15,
            radius: 40,
          ),
    );
  }
}
