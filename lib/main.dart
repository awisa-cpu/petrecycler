import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petrecycler/app.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/firebase_options.dart';

///this is the root and where initializations of needed services occur
void main() async {
  //all init must occur before runApp() is called

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

//initialize storage
  await GetStorage.init();

  // Prevents app from closing splash screen, app layout will be build but not displayed.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initFirebase();

  runApp(const MyApp());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) => Get.put(AuthRepository()));
}
