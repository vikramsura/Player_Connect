import 'dart:convert';

import 'package:flutter/material.dart';

import '../shared/All_Data.dart';
import '../Model_Class/player_view_model.dart';
import '../shared/SharedPreferences.dart';
import 'package:http/http.dart' as http;


class ProviderPlayerView with ChangeNotifier{

  List<PlayerViewBody>playerViewList=[];
  Future getUserProfile(context,id) async {
    Uri myUri = Uri.parse(ApiUtils.playerViewProfileApi+id.toString());
    final response = await http.get(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      // 'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      PlayerViewModel playerViewModel = PlayerViewModel.fromJson(data);
      playerViewList.addAll(playerViewModel.body!);
      // for (Map<String, dynamic> index in data) {
      //   playerViewList.add(PlayerViewBody.fromJson(index));
      //   print("aaaa${playerViewList.length}");
      //   }
      notifyListeners();
    } else {

      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
return playerViewList;
  }
}