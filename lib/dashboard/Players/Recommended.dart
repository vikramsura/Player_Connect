import 'package:flutter/material.dart';
import 'package:playerconnect/dashboard/Chat/ChatDetails.dart';
import 'package:playerconnect/dashboard/Players/View_Profile.dart';
import 'package:playerconnect/provider_data/provider_players.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';

import '../../provider_data/view_provider.dart';

class Recommended extends StatefulWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPlayers>(builder: (context, provider, child) {
      return  Scaffold(
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
                              provider.name[index],
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
                                Provider.of<ProviderPlayerView>(context,
                                    listen: false)
                                    .getUserProfile(
                                    context,
                                    provider.playerData[index].id
                                        .toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewProfile(),
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
                    provider.connect[index] == "Connect"
                        ? InkWell(
                      onTap: () {
                        if (provider.connect[index] == "Connect") {
                          provider.connect[index] = "Set";
                        } else {
                          provider.connect[index] = "Connect";
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
                              provider.connect[index],
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
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chat_Person(),
                                //     ));
                              },
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/iconImage/commentIconImg.png')),
                            ),
                            InkWell(
                              onTap: () {
                                provider.connect[index] = "Connect";
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
            itemCount: provider.name.length),
      );
    },);

  }
}
