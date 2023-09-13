import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/provider_data/view_provider.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../provider_data/profile_provider.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPlayerView>(
      builder: (context, provider, child) {
        return SafeArea(
            child: Scaffold(
          body: provider.playerViewModelBody == null
              ? Center(child: CircularProgressIndicator())
              : Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 1.7,
                            child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(ApiUtils.imageApi +
                                    provider.playerViewModelBody!.images
                                        .toString()))),
                      ],
                    ),
                  ),Positioned(top: AppFontSize.font10,left:AppFontSize.font10 ,
                child: IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back,color: Colors.white,size: AppFontSize.font20,))),
                  Positioned(
                      bottom: 0,
                      top: 300,
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.transparent,
                                Colors.white10,
                                Colors.white38,
                                Colors.white70,
                                Colors.white,
                                Colors.white,
                              ],
                                  stops: [
                                0.01,
                                0.02,
                                0.05,
                                0.1,
                                0.15,
                                0.3,
                              ])),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        provider.playerViewModelBody!.rating
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppFontSize.font40,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppFontSize.font10,
                                      ),
                                      RotatedBox(
                                          quarterTurns: 3,
                                          child: Text(
                                            provider.playerViewModelBody!
                                                        .ratingtype ==
                                                    0
                                                ? "UTR"
                                                : "NTRP",
                                            style: TextStyle(
                                                fontSize: AppFontSize.font16,
                                                letterSpacing:
                                                    AppFontSize.font4),
                                          )),
                                      SizedBox(
                                        width: AppFontSize.font10,
                                      ),
                                      Image.asset('assets/images/flagImg.png',
                                          height: AppFontSize.font20),
                                      SizedBox(
                                        width: AppFontSize.font10,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: AppColor.blue,
                                        radius: AppFontSize.font20,
                                        child: Image(
                                            height: AppFontSize.font20,
                                            image: AssetImage(
                                                'assets/iconImage/commentIconImg.png')),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Text(
                                    provider.playerViewModelBody!.firstName
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: AppFontSize.font35,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.blue),
                                  ),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Text2.text2(
                                      "${provider.playerViewModelBody!.city}, ${provider.playerViewModelBody!.country?.substring(0, 2).toUpperCase()}"),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text1.text1('Age'),
                                          SizedBox(
                                            height: AppFontSize.font20,
                                          ),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                                text: provider
                                                    .playerViewModelBody!.dob!
                                                    .split(" ")
                                                    .last,
                                                style: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize:
                                                        AppFontSize.font16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' Years',
                                                style: TextStyle(
                                                    color: AppColor.white1,
                                                    fontSize:
                                                        AppFontSize.font14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ]))
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppFontSize.font30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text1.text1('Height'),
                                          SizedBox(
                                            height: AppFontSize.font20,
                                          ),
                                          Text.rich(
                                              TextSpan(children: [
                                            TextSpan(
                                                text: provider
                                                    .playerViewModelBody!
                                                    .height!
                                                    .split(" ")
                                                    .first,
                                                style: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize:
                                                        AppFontSize.font16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    "(${provider.playerViewModelBody!.height!.split("(").last}",
                                                style: TextStyle(
                                                    color: AppColor.white1,
                                                    fontSize:
                                                        AppFontSize.font14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ]))
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppFontSize.font30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text1.text1('Gender'),
                                          SizedBox(
                                            height: AppFontSize.font20,
                                          ),
                                          Text2.text2(provider
                                                      .playerViewModelBody!
                                                      .gender ==
                                                  0
                                              ? "Male"
                                              : provider.playerViewModelBody!
                                                          .gender ==
                                                      1
                                                  ? "Female"
                                                  : "Other"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text1.text1('Playing Style'),
                                          SizedBox(
                                            height: AppFontSize.font20,
                                          ),
                                          Text2.text2(provider
                                              .playerViewModelBody!
                                              .playingstyle),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppFontSize.font30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text1.text1('Dominant Hand'),
                                          SizedBox(
                                            height: AppFontSize.font20,
                                          ),
                                          Text2.text2(provider
                                                      .playerViewModelBody!
                                                      .dominnantHand ==
                                                  0
                                              ? "Right"
                                              : "Left"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Center(
                                      child: AppButton.appButton(
                                          context,
                                          'Connect',
                                          AppColor.skyBlue,
                                          AppColor.black,
                                          MediaQuery.of(context).size.width /
                                              2.5)),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Text1.text1('About Tennis Experience'),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  ReadMoreText(
                                    provider.playerViewModelBody!.about
                                        .toString(),
                                    trimLines: 3,
                                    style: TextStyle(
                                        fontSize: AppFontSize.font16,
                                        color: AppColor.black),
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    lessStyle: TextStyle(
                                        color: AppColor.skyBlue,
                                        fontSize: AppFontSize.font16,
                                        fontWeight: FontWeight.bold),
                                    moreStyle: TextStyle(
                                        color: AppColor.skyBlue,
                                        fontSize: AppFontSize.font16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text1.text1(provider.playerViewModelBody!
                                                  .ratingtype ==
                                              0
                                          ? "URT Rating"
                                          : "NTRP Rating"),
                                      Text2.text2(
                                          provider.playerViewModelBody!.rating),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text1.text1(
                                          'Preferred Distance from Count'),
                                      Text2.text2(provider
                                          .playerViewModelBody!.locationRange
                                          .toString()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  Text1.text1('You Desired Partner'),
                                  SizedBox(
                                    height: AppFontSize.font20,
                                  ),
                                  ReadMoreText(
                                    provider.playerViewModelBody!.desiredPartner
                                        .toString(),
                                    trimLines: 3,
                                    style: TextStyle(
                                        fontSize: AppFontSize.font16,
                                        color: AppColor.black),
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    lessStyle: TextStyle(
                                        color: AppColor.skyBlue,
                                        fontSize: AppFontSize.font16,
                                        fontWeight: FontWeight.bold),
                                    moreStyle: TextStyle(
                                        color: AppColor.skyBlue,
                                        fontSize: AppFontSize.font16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                        ),
                      )),
                ]),
        ));
      },
    );
  }
}
