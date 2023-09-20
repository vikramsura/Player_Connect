import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:http/http.dart' as http;
import 'package:playerconnect/Model_Class/user_profile_model.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';


class ProviderProfile with ChangeNotifier {
  UserProfileModelBody? userProfileModelBody;
  Future getUserProfile() async {
    Uri myUri = Uri.parse(ApiUtils.getUserProfileApi);
    final response = await http.get(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // connectionRequestDataList.clear();
      print("bbbbbb${response.body}");
      UserProfileModel getRequestListModel =
      UserProfileModel.fromJson(data);
       userProfileModelBody = getRequestListModel.body!;
      print("aaaaaa${userProfileModelBody!.firstName}");

      // print("aaaaaaaa${connectionRequestDataList.length}");
      notifyListeners();
      // print("playerData:::${playerConnectedData[0]}");
    } else {
      // AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }

  }
}