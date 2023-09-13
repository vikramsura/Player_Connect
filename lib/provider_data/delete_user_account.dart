import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Login/Login.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';


class ProviderDeleteUserAccount with ChangeNotifier {
  TextEditingController deleteController = TextEditingController();
  String? isOnTap;
  Future getDeleteUser(context) async {
    Uri myUri = Uri.parse(ApiUtils.deleteUserAccountApi);
    final response = await http.delete(myUri,headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      'Content-Type': 'application/json',
    }, body: {
      "delete_reason": isOnTap == 'Other'
          ?deleteController.text
          : isOnTap,

    });
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    if(response.statusCode==200){
      LocalDataSaver.setUserLogin(false);
      AppMassage.buildShowSnackBar(context, 'User Account Deleted  Successfully.');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);

    }else{
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
  }
}