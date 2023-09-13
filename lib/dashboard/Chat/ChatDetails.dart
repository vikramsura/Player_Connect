import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Model_Class/chat_model.dart';
import 'package:playerconnect/dashboard/Chat/chatMessageWidget.dart';
import 'package:playerconnect/provider_data/chat_provider.dart';
import 'package:playerconnect/provider_data/provider_connect.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';

class ChatDetailsPage extends StatefulWidget {
  final ChatConnectedModelBody chatConnectedModelBody;

  ChatDetailsPage({Key? key, required this.chatConnectedModelBody})
      : super(key: key);

  @override
  State<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderChat>(context, listen: false).socketConnect();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<ProviderChat>(context, listen: false).socket?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderChat>(
      builder: (context, provider, child) {
        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: ListTile(
                  leading: Stack(children: [
                    CircleAvatar(
                        radius: AppFontSize.font24,
                        backgroundImage: NetworkImage(ApiUtils.imageApi +
                            widget
                                .chatConnectedModelBody.receiverdetails!.images
                                .toString())),
                    Positioned(
                        right: 1,
                        bottom: 6,
                        child: CircleAvatar(
                          radius: AppFontSize.font6,
                          child: CircleAvatar(
                            radius: AppFontSize.font4,
                            backgroundColor: AppColor.liteGreen,
                          ),
                        ))
                  ]),
                  title: Text(
                    "${widget.chatConnectedModelBody.receiverdetails!.firstName} ${widget.chatConnectedModelBody.receiverdetails!.lastName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.font18,
                        color: AppColor.blue),
                  ),
                  subtitle: Text(
                    '${widget.chatConnectedModelBody.receiverdetails!.city}, ${widget.chatConnectedModelBody.receiverdetails!.country!.substring(0, 2).toUpperCase()}   7.9  UTR',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.font10,
                        color: AppColor.black),
                  ),
                )),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.chatMessagesList.length,
                    dragStartBehavior: DragStartBehavior.down,
                    itemBuilder: (context, index) {
                      final currentMessage = provider.chatMessagesList[index];
                      return ChatMessageWidget(
                          index: index, message: currentMessage);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: AppFontSize.font50,
                            child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.camera_enhance_rounded,
                                  size: AppFontSize.font28,
                                )),
                          ),
                          SizedBox(width: AppFontSize.font8),
                          Container(
                            height: AppFontSize.font50,
                            child: InkWell(
                                onTap: () {
                                  provider.handleAttachmentPressed(context);
                                },
                                child: Icon(
                                  Icons.photo_camera_back_outlined,
                                  size: AppFontSize.font28,
                                )),
                          ),
                          SizedBox(width: AppFontSize.font8),
                          Flexible(
                            child: Card(
                              child: TextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                controller: provider.massgController,
                                // maxLines: null,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding:
                                        EdgeInsets.all(AppFontSize.font12),
                                    hintText: "Messages.....",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                          SizedBox(width: AppFontSize.font8),
                          Container(
                            height: AppFontSize.font50,
                            child: InkWell(
                                onTap: () {
                                  provider.getChat();
                                  provider.socketConnect();
                                },
                                child: Icon(
                                  Icons.send,
                                  size: AppFontSize.font28,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
