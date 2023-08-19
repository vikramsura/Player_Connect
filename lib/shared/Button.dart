// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class AppButton {
  static Container appButton(
      BuildContext context, title, btnColor, styleColor, width) {
    return Container(
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 18, color: styleColor),
      )),
      height: MediaQuery.of(context).size.height / 14,
      width: width,
      decoration: BoxDecoration(
          color: btnColor, borderRadius: BorderRadius.circular(16)),
    );
  }
}
