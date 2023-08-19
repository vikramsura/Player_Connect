import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/dashboard/Players/View_Profile.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                foregroundColor: AppColor.white,
                title: Text(
                  "CONNECT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.blue,
                      fontSize: AppFontSize.font20),
                ),
                actions: [
                  Image(
                      height: AppFontSize.font24,
                      image: AssetImage('assets/iconImage/filterIconImg.png')),
                  SizedBox(
                    width:AppFontSize.font20,
                  )
                ],
                surfaceTintColor: AppColor.white,
                backgroundColor: AppColor.white),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Requests ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black,
                                  fontSize: AppFontSize.font18),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColor.skyBlue,
                              radius: AppFontSize.font10,
                              child: Center(
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.black,
                                      fontSize: AppFontSize.font12),
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "View More",
                              style: TextStyle(
                                  color: AppColor.skyBlue,
                                  fontSize: AppFontSize.font16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Container(
                          height: AppFontSize.font150,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: AppFontSize.font20,
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _name.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/connectWithImg.png'),
                                      radius:
                                      AppFontSize.font24,
                                    ),
                                    Positioned(
                                        right: -1,
                                        bottom: 6,
                                        child: CircleAvatar(
                                          radius: AppFontSize.font6,
                                          child: CircleAvatar(
                                            radius: AppFontSize.font4,
                                            backgroundColor:
                                                AppColor.liteGreen,
                                          ),
                                        ))
                                  ]),
                                  Text(
                                    "7.6  UTR",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppFontSize.font10,
                                        color: AppColor.black),
                                  ),
                                  Text(
                                    _name[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppFontSize.font14,
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
                                      ('View Profile'),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppFontSize.font10,
                                          color: AppColor.blue),
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Image(
                                          height: AppFontSize.font20,
                                          image: AssetImage(
                                              'assets/iconImage/aceptReqIconImg.png')),
                                      SizedBox(
                                        width:AppFontSize.font10,
                                      ),
                                      Image(
                                          height: AppFontSize.font24,
                                          image: AssetImage(
                                              'assets/iconImage/removeCircleIconImg.png')),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Divider(
                          thickness: AppFontSize.font4,
                        ),
                        SizedBox(
                          height: AppFontSize.font10,
                        ),
                        Text(
                          'Successful Matches',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black,
                              fontSize: AppFontSize.font18),
                        ),
                        SizedBox(
                          height:AppFontSize.font10,
                        ),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(leading:
                                  Stack(children: [
                                        CircleAvatar(
                                            radius: AppFontSize.font24,
                                            backgroundImage: AssetImage(
                                                'assets/images/connectWithImg.png')),
                                        Positioned(
                                            right: 0,
                                            bottom: 6,
                                            child: CircleAvatar(
                                              radius: AppFontSize.font6,
                                              child: CircleAvatar(
                                                radius: AppFontSize.font4,
                                                backgroundColor:
                                                    AppColor.liteGreen,
                                              ),
                                            )),
                                      ]),
                                title: Text(
                                            _name[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: AppColor.blue),
                                          ) ,
                                subtitle: Text(
                                  'New Lamont DE     7.9  UTR',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFontSize.font10,
                                      color: AppColor.black),
                                ),
                                trailing:
                                Container(
                                  height:AppFontSize.font30 ,
                                  width: AppFontSize.font80,
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image(
                                            height: AppFontSize.font24,
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/iconImage/commentIconImg.png')),
                                        Icon(Icons.more_horiz,size: AppFontSize.font24,)
                                      ]),
                                ),
                                );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: AppFontSize.font10,
                              );
                            },
                            itemCount: _name.length)
                      ]),
                ))));
  }
}
