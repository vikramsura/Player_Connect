// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/BottomNavigationBar.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
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
  bool isConnect = true;

  List btnList = [
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
    "Connect",
    "Connect",
    "Connect",
    "Connect",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(12),
                child: Stack(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Image.asset(
                          'assets/images/appLogin.png',
                          height: AppFontSize.font60,
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Text(
                          "Connect with",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.blue,
                              fontSize: AppFontSize.font16),
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: ListView.builder(
                            itemCount: _name.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                trailing: Container(
                                  height: AppFontSize.font100,
                                  width: AppFontSize.font100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(
                                              AppFontSize.font16)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/connectWithImg.png'))),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'New Lamant,DE      8.0 UTR',
                                      style: TextStyle(
                                          fontSize: AppFontSize.font12),
                                    ),
                                    SizedBox(
                                      height: AppFontSize.font20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // isConnect = !isConnect;

                                        if (btnList[index] == "Connect") {
                                          btnList[index] = "sent";
                                        } else {
                                          btnList[index] = "Connect";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppFontSize.font10),
                                            border: Border.all(
                                                color: AppColor.skyBlue),
                                            color: btnList[index] == "Connect"
                                                ? AppColor.skyBlue
                                                : AppColor.white),
                                        height: AppFontSize.font30,
                                        width: AppFontSize.font100,
                                        child: Center(
                                            child: Text(
                                          btnList[index],
                                          style: TextStyle(
                                              color: btnList[index] == "Connect"
                                                  ? AppColor.blue
                                                  : AppColor.skyBlue),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  _name[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFontSize.font16,
                                      color: AppColor.blue),
                                ),
                              );
                            },
                          ),
                        ),
                      ]),
                  Positioned(
                    bottom: 0,
                    top: MediaQuery.of(context).size.height / 1.168,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: AppButton.appButton(
                                context,
                                'BACK',
                                AppColor.skyBlue,
                                AppColor.blue,
                                MediaQuery.of(context).size.width / 2.5),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Bottombar(),
                                  ));
                            },
                            child: AppButton.appButton(
                                context,
                                'DONE',
                                AppColor.blue,
                                AppColor.white,
                                MediaQuery.of(context).size.width / 2.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
