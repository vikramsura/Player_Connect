import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/dashboard/My_Profile/Setting/Sittings.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../provider_data/profile_provider.dart';

class My_Profil extends StatefulWidget {
  const My_Profil({Key? key}) : super(key: key);

  @override
  State<My_Profil> createState() => _My_ProfilState();
}

class _My_ProfilState extends State<My_Profil> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderProfile>(
      builder: (context, provider, child) {
        return SafeArea(
            child: Scaffold(
          body: Stack(children: [
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
                              provider.userProfileModelBody!.images
                                  .toString()))),
                ],
              ),
            ),
            Positioned(
              top: 40,
              right: 14,
              child: CircleAvatar(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sittings(),
                          ));
                    },
                    child: Icon(size: AppFontSize.font20, Icons.edit)),
                radius: AppFontSize.font20,
              ),
            ),
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
                                  provider.userProfileModelBody!.rating
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
                                      "${provider.userProfileModelBody!.ratingtype == 0 ? "UTR" : "NTRP"}",
                                      style: TextStyle(
                                          fontSize: AppFontSize.font16,
                                          letterSpacing: AppFontSize.font4),
                                    )),
                                SizedBox(
                                  width: AppFontSize.font10,
                                ),
                                // Image.network( provider.userProfileModelBody!.countryFlag.toString(),
                                //     height: AppFontSize.font20),
                                SizedBox(
                                  width: AppFontSize.font10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Text(
                              "${provider.userProfileModelBody!.firstName}  ${provider.userProfileModelBody!.lastName}",
                              style: TextStyle(
                                  fontSize: AppFontSize.font35,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.blue),
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Text2.text2(
                                "${provider.userProfileModelBody!.city}, ${provider.userProfileModelBody!.country!.substring(0, 2).toUpperCase()}"),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text1.text1('Age'),
                                    SizedBox(
                                      height: AppFontSize.font20,
                                    ),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: provider
                                              .userProfileModelBody!.dob
                                              .toString()
                                              .split(" ")
                                              .last,
                                          style: TextStyle(
                                              color: AppColor.black,
                                              fontSize: AppFontSize.font16,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: ' Years',
                                          style: TextStyle(
                                              color: AppColor.white1,
                                              fontSize: AppFontSize.font14,
                                              fontWeight: FontWeight.bold)),
                                    ]))
                                  ],
                                ),
                                SizedBox(
                                  width: AppFontSize.font30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text1.text1('Height'),
                                    SizedBox(
                                      height: AppFontSize.font20,
                                    ),
                                    Text.rich(
                                        TextSpan(children: [
                                      TextSpan(
                                          text: provider
                                              .userProfileModelBody!.height
                                              .toString()
                                              .split(" ")
                                              .first,
                                          style: TextStyle(
                                              color: AppColor.black,
                                              fontSize: AppFontSize.font16,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              "(${provider.userProfileModelBody!.height?.split("(").last}",
                                          style: TextStyle(
                                              color: AppColor.white1,
                                              fontSize: AppFontSize.font14,
                                              fontWeight: FontWeight.bold)),
                                    ]))
                                  ],
                                ),
                                SizedBox(
                                  width: AppFontSize.font30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text1.text1('Gender'),
                                    SizedBox(
                                      height: AppFontSize.font20,
                                    ),
                                    Text2.text2(
                                        provider.userProfileModelBody!.gender ==
                                                0
                                            ? "Male"
                                            : provider.userProfileModelBody!
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text1.text1('Playing Style'),
                                    SizedBox(
                                      height: AppFontSize.font20,
                                    ),
                                    Text2.text2(provider.userProfileModelBody!.playingstyle.toString()),
                                  ],
                                ),
                                SizedBox(
                                  width: AppFontSize.font30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text1.text1('Dominant Hand'),
                                    SizedBox(
                                      height: AppFontSize.font20,
                                    ),
                                    Text2.text2(provider.userProfileModelBody!.dominnantHand==0?"Right":"Left"),
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
                                    MediaQuery.of(context).size.width / 2.5)),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Text1.text1('About Tennis Experience'),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            ReadMoreText(
                              provider.userProfileModelBody!.about.toString(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text1.text1("${provider.userProfileModelBody!.ratingtype==0?"UTR Rating":"NTRP Rating"}"),
                                Text2.text2(provider.userProfileModelBody!.rating),
                              ],
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text1.text1('Preferred Distance from Count'),
                                Text2.text2(provider.userProfileModelBody!.locationRange.toString()+" "+"miles"),
                              ],
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Text1.text1('You Disired Partner'),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            ReadMoreText(
                              provider.userProfileModelBody!.desiredPartner.toString(),
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
                ))
          ]),
        ));
      },
    );
  }
}
