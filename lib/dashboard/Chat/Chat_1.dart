import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Chat_Person extends StatefulWidget {
  const Chat_Person({Key? key}) : super(key: key);

  @override
  State<Chat_Person> createState() => _Chat_PersonState();
}

class _Chat_PersonState extends State<Chat_Person> {
  TextEditingController _massgController = TextEditingController();

  bool isDeny = true;

  List _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: ListTile(
              leading: Stack(children: [
                CircleAvatar(
                    radius: AppFontSize.font24,
                    backgroundImage:
                        AssetImage('assets/images/connectWithImg.png')),
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
                'Doris',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.font18,
                    color: AppColor.blue),
              ),
              subtitle: Text(
                'New Lamont DE     7.9  UTR',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.font10,
                    color: AppColor.black),
              ),
            )),
        body: isDeny == true
            ? Container(
                height: AppFontSize.font200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Connect with this person?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFontSize.font16,
                              color: AppColor.black),
                        ),
                        Text(
                          'Please read the full text so that you can understand what actions will and will not be tolerated',
                          style: TextStyle(
                              fontSize: AppFontSize.font16,
                              color: AppColor.white1),
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isDeny = false;
                                });
                              },
                              child: Container(
                                child: Row(children: [
                                  Image(
                                      height: AppFontSize.font24,
                                      image: AssetImage(
                                          'assets/iconImage/aceptReqIconImg.png')),
                                  SizedBox(
                                    width: AppFontSize.font10,
                                  ),
                                  Text(
                                    'Connect',
                                    style: TextStyle(
                                        fontSize: AppFontSize.font16,
                                        color: AppColor.black),
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: AppFontSize.font30,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isDeny = false;
                                });
                              },
                              child: Container(
                                child: Row(children: [
                                  Image(
                                      height: AppFontSize.font28,
                                      image: AssetImage(
                                          'assets/iconImage/removeCircleIconImg.png')),
                                  SizedBox(
                                    width: AppFontSize.font10,
                                  ),
                                  Text(
                                    'Deny',
                                    style: TextStyle(
                                        fontSize: AppFontSize.font16,
                                        color: AppColor.black),
                                  ),
                                ]),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        return index % 2 == 0
                            ? sendMessage(_messages[index])
                            : receivedMessage(_messages[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              getImage(ImageSource.camera);
                            },
                            child: Icon(Icons.camera_enhance_rounded)),

                        Container(
                          height: AppFontSize.font50,
                          width: AppFontSize.font260,
                          child: TextFormField(
                            controller: _massgController,
                            decoration: InputDecoration(
                                prefixIcon: InkWell(
                                    onTap: () {
                                      _handleAttachmentPressed();
                                    },
                                    child: Icon(Icons.file_upload)),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      if (_massgController.text
                                          .trim()
                                          .isNotEmpty) {
                                        setState(() {
                                          _messages.add(_massgController.text
                                              .trimLeft()
                                              .trimRight());
                                          _massgController.clear();
                                        });
                                      }
                                    },
                                    child: Icon(Icons.send)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppFontSize.font20),
                                    borderSide:
                                        BorderSide(color: AppColor.black))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
  }

  void _handleAttachmentPressed() {
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
                      getImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.browse_gallery)),
                IconButton(
                    color: AppColor.skyBlue,
                    iconSize: AppFontSize.font50,
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_enhance_rounded)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  File? photofill;

  getImage(source) async {
    final picker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await picker.pickImage(source: source);
    photofill = File(pickedFile!.path);
    setState(() {});
    Navigator.of(context).pop();
    _messages.add(photofill!.path);
  }

  receivedMessage(msg) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: AppFontSize.font260,
            decoration: BoxDecoration(
                color: AppColor.white1,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppFontSize.font20),
                  bottomLeft: Radius.circular(AppFontSize.font20),
                  bottomRight: Radius.circular(AppFontSize.font20),
                )),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(msg, style: TextStyle(fontSize: AppFontSize.font18)),
                ],
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }

  sendMessage(msg) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width:AppFontSize.font260,
            decoration: BoxDecoration(
                color: AppColor.skyBlue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppFontSize.font20),
                  bottomLeft: Radius.circular(AppFontSize.font20),
                  topLeft: Radius.circular(AppFontSize.font20),
                )),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(msg,
                      style: TextStyle(
                        fontSize: AppFontSize.font18,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
