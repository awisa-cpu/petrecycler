import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petrecycler/utilities/loaders/loading_controller.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomOverlayLoader {
  factory CustomOverlayLoader() => _sharedInstance;
  static final CustomOverlayLoader _sharedInstance =
      CustomOverlayLoader._instance();
  CustomOverlayLoader._instance();

  LoadingController? loadingController;

  LoadingController showOverLay({
    required BuildContext context,
    required String text,
  }) {
    //
    final stringController = StreamController<String>();
    stringController.add(text);

    //
    final overLayState = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    //
    final overLayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(200),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.8,
                maxWidth: size.width * 0.8,
                minWidth: size.width * 0.5,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.5)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //
                      const SizedBox(
                        height: 10,
                      ),

                      const CircularProgressIndicator(),

                      const SizedBox(
                        height: 20,
                      ),

                      //
                      StreamBuilder(
                        stream: stringController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data as String);
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

/*
    final entry2 = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(70),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //

                const SizedBox(
                  height: 15.7,
                ),

                //
                const SpinKitWave(
                  color: Colors.green,
                  size: 25.5,
                  // backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 10.5,
                ),
                StreamBuilder(
                  stream: stringController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data as String,
                        style: const TextStyle(color: Colors.white),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

*/
    overLayState.insert(overLayEntry);

    return LoadingController(
      close: () {
        stringController.close();
        overLayEntry.remove();
        return true;
      },
      update: (text) {
        stringController.add(text);
        return true;
      },
    );
  }

  void startLoader({
    required BuildContext context,
    required String text,
  }) {
    if (loadingController?.update(text) ?? false) {
    } else {
      loadingController = showOverLay(context: context, text: text);
    }
  }

  void stopLoader() {
    loadingController?.close();
    loadingController = null;
  }
}
