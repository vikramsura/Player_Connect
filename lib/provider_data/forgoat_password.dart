import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playerconnect/UI/Login/Login.dart';

import '../shared/All_Data.dart';
import 'package:http/http.dart' as http;



class ProviderForgoatPassword with ChangeNotifier{
  TextEditingController emailController=TextEditingController();

  Future forgoatPassword(context) async {
    Uri myUri = Uri.parse(ApiUtils.forgotPasswordApi);
    final response = await http.delete(myUri, body: {
      "email": emailController

    });
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    if(response.statusCode==200){

      AppMassage.buildShowSnackBar(context, 'User Account Successfully.');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);

    }else{
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
  }
}