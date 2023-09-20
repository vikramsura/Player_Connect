import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/Model_Class/search_player_model.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';
import 'package:provider/provider.dart';

import '../Model_Class/model_player.dart';

class ProviderPlayers with ChangeNotifier {
  List name = [
    'Doris Edwads',
    'Scott Baker',
    'Carlos Alcaraz',
    'Doris Edwads',
    'Scott Baker',
    'Carlos Alcaraz',
    'Doris Edwads',
    'Scott Baker',
    'Carlos Alcaraz',
    'Doris Edwads',
    'Scott Baker',
    'Carlos Alcaraz',
    'Doris Edwads',
    'Scott Baker',
    'Carlos Alcaraz',
  ];
  List connect = [
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
    "Connect",
  ];
  bool isConnect = true;
  List<GetPlayersListModelBody> playerData = [];

  Future<List<GetPlayersListModelBody>> getPlayer() async {
    Uri myUri = Uri.parse(ApiUtils.getPlayerlistApi);
    final response = await http.get(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {

      GetPlayersListModel getPlayersListModel =
          GetPlayersListModel.fromJson(data);
      List<GetPlayersListModelBody> bodydata = getPlayersListModel.body!;
      playerData.addAll(bodydata);
notifyListeners();
    } else {
      // AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
    return playerData;
  }

  List<SearchPlayerModelBody> searchPlayerList = [];

  Future<List<SearchPlayerModelBody>> recommendedPlayer(context) async {
    Uri myUri = Uri.parse(ApiUtils.searchPlayerApi);
    final response = await http.post(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      searchPlayerList.clear();
      SearchPlayerModel searchPlayerModel =
      SearchPlayerModel.fromJson(data);
      List<SearchPlayerModelBody> bodydata = searchPlayerModel.body!;
      searchPlayerList.addAll(bodydata);
      notifyListeners();
print("aaabbbbbcccc${data}");
print("aaabbbbb${searchPlayerList.length}");
      // AppMassage.buildShowSnackBar(context, 'Login Successfully');
      } else {
        AppMassage.buildShowSnackBar(context, 'Something went wrong');
      }
      return searchPlayerList;
    }




  Future sendFriendRequest(context, id,index) async {
    Uri myUri = Uri.parse(ApiUtils.friendRequestApi);
    final response = await http.post(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      // 'Content-Type': 'application/json',
    }, body: {
      "receiverId": id.toString(),
      "status": "1",
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {

      AppMassage.buildShowSnackBar(context, 'Friend request sent successfully');
      playerData[index].socialId=1;
      notifyListeners();

    } else {
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
    return;
  }



  Future deleteFriendRequest(context,index) async {
    Uri myUri = Uri.parse(ApiUtils.delterequestApi);
    final response = await http.delete(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      // 'Content-Type': 'application/json',
    }, );
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {

      AppMassage.buildShowSnackBar(context, ' Request delete successfully');
      playerData[index].socialId = null;
      notifyListeners();

    } else {
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
    return;
  }
}
