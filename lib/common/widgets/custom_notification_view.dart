import 'package:flutter/material.dart';
import 'package:petrecycler/common/widgets/custom_rounded_containder.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Icon(
        Icons.notifications_active_outlined,
        size: 30,
      ),
      Positioned(
          right: 1,
          top: 0,
          child: CustomRoundedContainer(
            backgroundColor: Colors.red,
            width: 17,
            height: 17,
            alignment: Alignment.center,
            child: Text(
              '2',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: Colors.white),
            ),
          ))
    ]);
  }
}
