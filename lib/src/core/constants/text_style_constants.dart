import 'package:flutter/material.dart';

class TextStyleConstants {
  static TextStyle headline1(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle headline2(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!;
  }

  static TextStyle bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

  static TextStyle bodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!;
  }

  static TextStyle caption(BuildContext context) {
    return bodyMedium(context).copyWith(color: const Color(0xFF979797));
  }
}
