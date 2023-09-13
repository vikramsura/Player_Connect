import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:http/http.dart' as http;
import 'package:playerconnect/BottomNavigationBar.dart';
import 'package:playerconnect/Model_Class/chat_model.dart';

import '../Model_Class/chat_message_model.dart';
import '../shared/SharedPreferences.dart';

class ProviderChat with ChangeNotifier {
  TextEditingController massgController = TextEditingController();

  bool isDeny = true;
  File? photofill;
  List messages = [];
  List<ChatConnectedModelBody> chatList = [];

  Future<List<ChatConnectedModelBody>> getChat() async {
    Uri myUri = Uri.parse(ApiUtils.connectedplayerlistApi);
    final response = await http.get(myUri, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      chatList.clear();

      ChatConnectedModel getPlayersListModel =
          ChatConnectedModel.fromJson(data);
      List<ChatConnectedModelBody> bodydata = getPlayersListModel.body!;
      chatList.addAll(bodydata);
      print(chatList.length);
      notifyListeners();
    } else {
      // AppMassage.buildShowSnackBar(context, 'Something went wrong');
    }
    return chatList;
  }

  IO.Socket? socket;
  List<ChatMessageModel> chatMessagesList = [];

  void socketConnect() {
    socket = IO.io("http://18.220.106.62:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket?.connect();
    socket?.on("chat_message", (data) {
      chatMessagesList.add(ChatMessageModel(
        sender: data["sender_id"].toString(),
        message: data["message"].toString(),
        timeStamp: DateTime.now(),
      ));
      notifyListeners();
    });
  }



  void handleAttachmentPressed(context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: AppFontSize.font100,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    color: AppColor.skyBlue,
                    iconSize: AppFontSize.font50,
                    onPressed: () {
                      getImage(context,ImageSource.gallery);
                    },
                    icon: Icon(Icons.browse_gallery)),
                IconButton(
                    color: AppColor.skyBlue,
                    iconSize: AppFontSize.font50,
                    onPressed: () {
                      getImage(context,ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_enhance_rounded)),
              ],
            ),
          ),
        ),
      ),
    );
  }


  getImage(context,source) async {
    final picker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await picker.pickImage(source: source);
    photofill = File(pickedFile!.path);
    notifyListeners();
    Navigator.of(context).pop();
    messages.add(photofill!.path);
  }
}
