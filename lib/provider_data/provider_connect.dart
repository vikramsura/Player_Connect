import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/Model_Class/connection_model.dart';
import 'package:playerconnect/Model_Class/modelConnect.dart';
import 'package:http/http.dart' as http;
import 'package:playerconnect/shared/SharedPreferences.dart';


class ProviderConnect with ChangeNotifier{
  List<PlayerConnectedBody> playerConnectedData = [];
  List<ConnectionRequestModelBody> connectionRequestDataList = [];

  Future<List<PlayerConnectedBody>> getConnect() async {
    Uri myUri = Uri.parse(ApiUtils.connectedplayerlistApi);
    final response = await http.get(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      playerConnectedData.clear();
      // print("bbbbbb${response.body}");

      PlayerConnectedModel getPlayersListModel =
      PlayerConnectedModel.fromJson(data);
      List<PlayerConnectedBody> bodydata = getPlayersListModel.body!;
      playerConnectedData.addAll(bodydata);
notifyListeners();
    } else {
      // AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
    return playerConnectedData;
  }


  Future<List<ConnectionRequestModelBody>> getConnectionRequest() async {
    Uri myUri = Uri.parse(ApiUtils.connectrequestlistApi);
    final response = await http.get(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      connectionRequestDataList.clear();
      print("bbbbbb${response.body}");
      ConnectionRequestModel getRequestListModel =
      ConnectionRequestModel.fromJson(data);
      List<ConnectionRequestModelBody> bodydata = getRequestListModel.body!;
      connectionRequestDataList.addAll(bodydata);
      print("aaaaaaaa${connectionRequestDataList.length}");
      notifyListeners();
      // print("playerData:::${playerConnectedData[0]}");
    } else {
      // AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
    return connectionRequestDataList;
  }



  Future acptDenyFriendRequest(context, id,index,status) async {
    Uri myUri = Uri.parse(ApiUtils.acceptfriendRequestApi);
    final response = await http.post(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      // 'Content-Type': 'application/json',
    }, body: {
      "senderId": id.toString(),
      "status": status.toString(),
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      AppMassage.buildShowSnackBar(context, status==2?"Request accept successfully":"Request accept denised successfully");
      connectionRequestDataList.removeAt(index);
      notifyListeners();

    } else {
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
    return;
  }
}