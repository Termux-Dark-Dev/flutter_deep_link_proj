import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showCustomSnackBar(
      {required BuildContext context,
      required String msg,
      required IconData? icon,
      required Color? snackBarColor,
      required AnimatedSnackBarType type}) {
    AnimatedSnackBar snackBar = AnimatedSnackBar(
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: const Duration(seconds: 3),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: snackBarColor,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                msg,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              )
            ],
          ),
        );
      },
    );
    snackBar.show(context);
  }
}
