import 'dart:convert';

import 'package:flutter/material.dart';

import '../All_Data.dart';
import '../Model_Class/player_view_model.dart';
import '../shared/SharedPreferences.dart';
import 'package:http/http.dart' as http;


class ProviderPlayerView with ChangeNotifier{
  PlayerViewModelBody? playerViewModelBody;
  Future getUserProfile(context,id) async {
    playerViewModelBody=null;
    Uri myUri = Uri.parse(ApiUtils.playerViewProfileApi+id.toString());
    final response = await http.get(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      // 'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // connectionRequestDataList.clear();
      print("bbbbbb${response.body}");
      PlayerViewModel getRequestListModel =
      PlayerViewModel.fromJson(data);
      playerViewModelBody = getRequestListModel.body!;
      // print("aaaaaa${playerViewModelBody!.firstName}");
      notifyListeners();
    } else {
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }

  }
}