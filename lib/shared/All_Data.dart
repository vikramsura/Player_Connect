import 'package:flutter/material.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

import 'constant/appColors.dart';

class ApiUtils {
  static String baseUrl = "http://18.220.106.62:3000/";
  static String singUpApi = "${baseUrl}sign_up";
  static String imageApi = "${baseUrl}images/";
  static String loginApi = "${baseUrl}login";
  static String friendRequestApi = "${baseUrl}friendRequest";
  static String searchPlayerApi = "${baseUrl}searchplayer";
  static String getPlayerlistApi = "${baseUrl}getplayerlist";
  static String delterequestApi = "${baseUrl}delterequest";
  static String connectedplayerlistApi = "${baseUrl}connectedplayerlist";
  static String connectrequestlistApi = "${baseUrl}connectrequestlist";
  static String acceptfriendRequestApi = "${baseUrl}acceptfriendRequest";
  static String getUserProfileApi = "${baseUrl}get_user_profile";
  static String changePasswordApi = "${baseUrl}changePassword";
  static String playerViewProfileApi = "${baseUrl}view/";
  static String deleteUserAccountApi = "${baseUrl}deleteuseraccount";
  static String logOutApi = "${baseUrl}log_out";
  static String forgotPasswordApi = "${baseUrl}forgot_password";
}

double progressValu = 0.2;
int progressValue = 1;

class AppMassage {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      buildShowSnackBar(BuildContext context, text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColor.skyBlue,
      content: Text(
        text,
        style: TextStyle(
            fontSize: AppFontSize.font16, fontWeight: FontWeight.bold,color: AppColor.blue,fontStyle: FontStyle.italic),
      ),
      duration: Duration(seconds: 1),
    ));
  }
}

class Text1 {
  static Text text1(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.white1),
    );
  }
}

class Text2 {
  static Text text2(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.black),
    );
  }

  static Text blue(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.blue),
    );
  }
}
