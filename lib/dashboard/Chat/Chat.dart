import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/dashboard/Chat/Chat_1.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List _name = [
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
  List MassageNo = [
    "1",
    "3",
    "4",
    "6",
    "2",
    "1",
    "7",
  ];
  bool isvalue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'CHAT',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.blue,
              fontSize: AppFontSize.font20),
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
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(leading:  Stack(children: [
                                CircleAvatar(
                                    radius: AppFontSize.font30,
                                    backgroundImage: AssetImage(
                                        'assets/images/connectWithImg.png')),
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
                  title:
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat_Person(),
                          ));
                    },
                    child: Text(
                      _name[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.font18,
                          color: AppColor.blue),
                    ),
                  ),
                    subtitle: Text(
                      'New Lamont DE     7.9  UTR',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.font10,
                          color: AppColor.black),
                    ),
                    trailing:  index <= 6
                        ? Container(
                      width: AppFontSize.font40,
                      height:
                      AppFontSize.font30,
                      decoration: BoxDecoration(
                          color: AppColor.skyBlue,
                          borderRadius: BorderRadius.circular(AppFontSize.font20)),
                      child: Center(
                          child: Text(
                            MassageNo[index],
                            style: TextStyle(
                                fontSize: AppFontSize.font14, color: AppColor.black),
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
                itemCount: _name.length),
          ],
        ),
      ),
    ));
  }
}
