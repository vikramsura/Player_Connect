// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:playerconnect/dashboard/Chat/Chat_1.dart';
import 'package:playerconnect/dashboard/Players/Recommended.dart';
import 'package:playerconnect/dashboard/Players/View_Profile.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/filter_utr_reating_dialog_box.dart';

class Players extends StatefulWidget {
  const Players({Key? key}) : super(key: key);

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
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
  List _Connect = [
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "PLAYERS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.blue,
                    fontSize: AppFontSize.font20),
              ),
              surfaceTintColor: AppColor.white,
              backgroundColor: AppColor.white),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommended",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                            fontSize: AppFontSize.font18),
                      ),
                      SizedBox(
                        height: AppFontSize.font10,
                      ),
                      Container(
                        height: AppFontSize.font150,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: AppFontSize.font10,
                            );
                          },
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _name.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/connectWithImg.png'),
                                    radius: MediaQuery.of(context).size.height /
                                        AppFontSize.font20,
                                  ),
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
                                Text(
                                  "7.6  UTR",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppFontSize.font14,
                                      color: AppColor.black),
                                ),
                                Text(
                                  _name[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFontSize.font16,
                                      color: AppColor.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Connect_ok(),
                                        ));
                                  },
                                  child: Text(
                                    ('View Profile'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppFontSize.font12,
                                        color: AppColor.blue),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: AppFontSize.font10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: ('Search Players'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Filter();
                                  });
                            },
                            child: Image(
                                height: AppFontSize.font20,
                                image: AssetImage(
                                    'assets/iconImage/filterIconImg.png')),
                          ),
                          SizedBox(
                            width: AppFontSize.font20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Recommended(),
                                  ));
                            },
                            child: Image(
                                height: AppFontSize.font30,
                                image: AssetImage(
                                    'assets/iconImage/shortIconImg.png')),
                          ),
                        ],
                      ),
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(children: [
                                    CircleAvatar(
                                        radius: AppFontSize.font35,
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
                                  Container(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _name[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: AppFontSize.font16,
                                                color: AppColor.blue),
                                          ),
                                          Text(
                                            'New Lamont DE     7.9  UTR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: AppFontSize.font10,
                                                color: AppColor.black),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Connect_ok(),
                                                  ));
                                            },
                                            child: Text(
                                              'View Profile',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: AppFontSize.font14,
                                                  color: AppColor.blue),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  _Connect[index] == "Connect"
                                      ? InkWell(
                                          onTap: () {
                                            if (_Connect[index] == "Connect") {
                                              _Connect[index] = "Set";
                                            } else {
                                              _Connect[index] = "Connect";
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: AppFontSize.font80,
                                            height: AppFontSize.font35,
                                            decoration: BoxDecoration(
                                                color: AppColor.skyBlue,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppFontSize.font10)),
                                            child: Center(
                                                child: Text(
                                              _Connect[index],
                                              style: TextStyle(
                                                  fontSize: AppFontSize.font14,
                                                  color: AppColor.black),
                                            )),
                                          ),
                                        )
                                      : Container(
                                          width: AppFontSize.font80,
                                          height: AppFontSize.font30,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Chat_Person(),
                                                        ));
                                                  },
                                                  child: Image(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/iconImage/commentIconImg.png')),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _Connect[index] = "Connect";
                                                    setState(() {});
                                                  },
                                                  child: Image(
                                                      image: AssetImage(
                                                          'assets/iconImage/removeCircleIconImg.png')),
                                                )
                                              ]),
                                        )
                                ]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: AppFontSize.font20,
                            );
                          },
                          itemCount: _name.length)
                    ]),
              ))),
    );
  }
}
