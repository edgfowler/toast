// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Toast {
  static const int LENGTH_SHORT = 1;
  static const int LENGTH_LONG = 2;
  static const int BOTTOM = 0;
  static const int CENTER = 1;
  static const int TOP = 2;

  BuildContext context;
  String message;
  int duration;
  int gravity;
  Color backColor;
  Color textColor;
  double backRadius;
  Border border;
  Icon? icon;

  Toast({
    required this.context,
    required this.message,
    this.textColor = const Color(0xFF000000), // Black
    this.backColor = const Color(0xFFEEEEEE), // Grey 200
    this.backRadius = 25,
    this.border = const Border(),
    this.duration = Toast.LENGTH_LONG,
    this.gravity = Toast.CENTER,
    this.icon,
  });

  static void show(Toast toast) {
    _Toaster(toast).show();
  }

  static void info(Toast toast) {
    toast.icon = const Icon(Icons.info);
    toast.backColor = Colors.blue.shade200;
    _Toaster(toast).show();
  }

  static void warn(Toast toast) {
    toast.icon = const Icon(Icons.warning);
    toast.backColor = Colors.amberAccent;
    _Toaster(toast).show();
  }

  static void error(Toast toast) {
    toast.icon = const Icon(Icons.error);
    toast.backColor = Colors.redAccent;
    _Toaster(toast).show();
  }
}

class _Toaster {
  Toast toast;

  _Toaster(
    this.toast,
  );

  void show() async {
    double? upperG;
    double? lowerG;

    switch (toast.gravity) {
      case Toast.TOP:
        upperG = 50;
        break;
      case Toast.BOTTOM:
        lowerG = 50;
        break;
      default:
        upperG = 0;
        lowerG = 0;
    }

    OverlayState? overlayState = Overlay.of(toast.context);

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: 0,
        right: 0,
        top: upperG,
        bottom: lowerG,
        child: Material(
          color: Colors.transparent,
          child: buildToast(),
        ),
      ),
    );

    overlayState?.insert(overlayEntry);
    await Future.delayed(Duration(seconds: toast.duration))
        .then((value) => overlayEntry.remove());
  }

  Widget buildToast() => Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(toast.backRadius),
            color: toast.backColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (toast.icon != null) ...[
                toast.icon!, // Checked for null, so ! is OK.
                const SizedBox(width: 7, height: 25),
                Text(toast.message),
              ] else ...[
                const SizedBox(width: 1, height: 25),
                Text(toast.message),
                const SizedBox(width: 1, height: 25),
              ]
            ],
          ),
        ),
      );
}
