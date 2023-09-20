import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:http/http.dart' as http;
import 'package:playerconnect/UI/Login/Login.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';

class ProviderSetting with ChangeNotifier {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  bool isCurrentPassword = true;
  bool isNewPassword = true;
  bool isConfirmPassword = true;
  bool isemail = true;
  bool isphone = true;
  bool isappN = true;

  Future<List> updatePassword(context) async {
    Uri myUri = Uri.parse(ApiUtils.changePasswordApi);
    final responses = await http.put(
      myUri,
      headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
        // 'Content-Type': 'application/json'
      },
      body: {
        "oldpassword": oldPasswordController.text,
        "newpassword": newPasswordController.text,
        "confirm_password": confirmPasswordController.text,
      },
    );
    var data = jsonDecode(responses.body) as Map<String, dynamic>;
    print("data:::::$data");
    if (responses.statusCode == 200) {
      AppMassage.buildShowSnackBar(context, 'Password Update Successfully');
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
     Navigator.pop(context);
    } else if(data['message']== "Old password does not match"){
    print(data);
    AppMassage.buildShowSnackBar(context, ' Old password does not match');
  }else {
      print(data);
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
    return [];
  }


  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future logOut(context) async {
    Uri myUri = Uri.parse(ApiUtils.logOutApi);
    final responses = await http.post(
      myUri,
      headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
        'Content-Type': 'application/json'
      },);
    var data = jsonDecode(responses.body) as Map<String, dynamic>;
    if (responses.statusCode == 200) {
      await googleSignIn.signOut();
      await auth.signOut();
      AppMassage.buildShowSnackBar(context, 'LogOut Successfully');
      LocalDataSaver.setUserLogin(false);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);

    } else {
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
  }
}
