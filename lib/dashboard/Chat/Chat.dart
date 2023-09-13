import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/dashboard/Chat/ChatDetails.dart';
import 'package:playerconnect/provider_data/chat_provider.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {

  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {


  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderChat>(
      builder: (context, provider, child) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: InkWell(
              onTap: () {
                provider.getChat();
              },
              child: Text(
                'CHAT',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.blue,
                    fontSize: AppFontSize.font20),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: ('Search Players'),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                ListView.separated(
                  itemCount: provider.chatList.length,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = provider.chatList[index].receiverdetails!;
                    return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatDetailsPage(chatConnectedModelBody: provider.chatList[index]),
                              ));
                        },
                      leading: Stack(children: [
                        CircleAvatar(
                            radius: AppFontSize.font30,
                            backgroundImage: NetworkImage(
                                ApiUtils.imageApi + data.images.toString())),
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
                        "${data.firstName} ${data.lastName}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontSize.font18,
                            color: AppColor.blue),
                      ),
                      subtitle: Text(
                        "${data.rating}  ${data.ratingtype == 0 ? "URT" : "NTRP"}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontSize.font10,
                            color: AppColor.black),
                      ),
                      trailing: index <= 6
                          ? Container(
                              width: AppFontSize.font40,
                              height: AppFontSize.font30,
                              decoration: BoxDecoration(
                                  color: AppColor.skyBlue,
                                  borderRadius: BorderRadius.circular(
                                      AppFontSize.font20)),
                              child: Center(
                                  child: Text(
                                index.toString(),
                                style: TextStyle(
                                    fontSize: AppFontSize.font14,
                                    color: AppColor.black),
                              )),
                            )
                          : SizedBox(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: AppFontSize.font20,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
