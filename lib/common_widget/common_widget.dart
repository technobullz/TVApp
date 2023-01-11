import 'package:flutter/material.dart';

class CommonWidget {
  static commonBackground({required Widget body}) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: body);
  }

  static commonAppLogo({required double height, required double width}) {
    return Image.asset(
      'assets/images/logo.png',
      height: height,
      width: width,
    );
  }
}
