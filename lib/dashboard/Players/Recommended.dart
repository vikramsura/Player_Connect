import 'package:flutter/material.dart';
import 'package:playerconnect/dashboard/Chat/Chat_1.dart';
import 'package:playerconnect/dashboard/Players/View_Profile.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Recommended extends StatefulWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'Recommended',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.blue, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(children: [
                    CircleAvatar(
                        radius: AppFontSize.font35,
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
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    builder: (context) => Connect_ok(),
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
                                    BorderRadius.circular(AppFontSize.font10)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Chat_Person(),
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
          itemCount: _name.length),
    );
  }
}
