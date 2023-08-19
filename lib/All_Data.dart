
import 'package:flutter/material.dart';

import 'shared/constant/appColors.dart';


double progressValu = 0.2;
int progressValue = 1;

class AppMassage {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      buildShowSnackBar(BuildContext context, text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    ));
  }
}

class Text1 {
  static Text  text1 (title){
    return Text(title,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.white1),
    );
  }
}


class Text2 {
  static Text text2(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.black),
    );
  }
  static Text blue (title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.blue),
    );
  }
}




