import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class NetWorkManager extends GetxController {
  static NetWorkManager get instance => Get.find();

  //variables
  final Connectivity connectivity = Connectivity();
  late final StreamSubscription<List<ConnectivityResult>> onConnectivityChanged;

  //methods
  @override
  void onInit() {
    super.onInit();
    onConnectivityChanged = connectivity.onConnectivityChanged.listen(
      (event) => checkConnectivity(event),
    );
  }

  void checkConnectivity(List<ConnectivityResult> result) {
    if (result.any((element) => element == ConnectivityResult.none)) {
      CustomSnackBars.showInforSnackBar(
          title: 'Oh snap', message: 'No internet connection');
    }
  }

  Future<bool> checkInternet() async {
    final connections = await connectivity.checkConnectivity();

    if (connections.any((element) => element == ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void onClose() {
    super.onClose();
    onConnectivityChanged.cancel();
  }
}
