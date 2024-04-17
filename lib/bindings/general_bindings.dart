

import 'package:get/get.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/data/services/notification_service/notification_service.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetWorkManager());
    Get.put(NotificationService());
  }

} 