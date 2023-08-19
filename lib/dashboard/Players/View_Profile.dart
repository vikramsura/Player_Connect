import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:readmore/readmore.dart';

class Connect_ok extends StatefulWidget {
  const Connect_ok({Key? key}) : super(key: key);

  @override
  State<Connect_ok> createState() => _Connect_okState();
}

class _Connect_okState extends State<Connect_ok> {
  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage('assets/images/connectWithImg.png'))),
            ],
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
                              '11.7',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                AppFontSize.font40,
                              ),
                            ),
                            SizedBox(
                              width: AppFontSize.font10,
                            ),
                            RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'UTR',
                                  style: TextStyle(
                                      fontSize: AppFontSize.font16, letterSpacing: AppFontSize.font4),
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
                          height:AppFontSize.font20,
                        ),
                        Text(
                          'Doris Edwards',
                          style: TextStyle(
                              fontSize: AppFontSize.font35,
                              fontWeight: FontWeight.bold,
                              color: AppColor.blue),
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Text2.text2('New Lamont, DE'),
                        SizedBox(
                          height:AppFontSize.font20,
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
                                      text: '21 ',
                                      style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: AppFontSize.font16,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: 'Years ',
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
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "6'5''",
                                      style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: AppFontSize.font16,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "(196cm)",
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
                                Text2.text2('Male'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height:AppFontSize.font20,
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
                                Text2.text2('Counter Puncher'),
                              ],
                            ),
                            SizedBox(
                              width:  AppFontSize.font30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text1.text1('Dominant Hand'),
                                SizedBox(
                                  height:  AppFontSize.font20,
                                ),
                                Text2.text2('Right'),
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
                          height:  AppFontSize.font20,
                        ),
                        Text1.text1('About Tennis Experience'),
                        SizedBox(
                          height:  AppFontSize.font20,
                        ),
                        ReadMoreText(
                          "Travelling the world is an exhilarating experience, but there are certain destinations where every traveller needs to be cautious due to the prevalence of crime, civil unrest, terrorism among other dangerous factors. If you're planning a foreign holiday, one of the most important things to check is whether the destination",
                          trimLines: 3,
                          style: TextStyle(
                              fontSize:  AppFontSize.font16,
                              color: AppColor.black),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          lessStyle: TextStyle(
                              color: AppColor.skyBlue,
                              fontSize:  AppFontSize.font16,
                              fontWeight: FontWeight.bold),
                          moreStyle: TextStyle(
                              color: AppColor.skyBlue,
                              fontSize:  AppFontSize.font16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text1.text1('UTR Rating'),
                            Text2.text2('11.3 UTR'),
                          ],
                        ),
                        SizedBox(
                          height:  AppFontSize.font20,
                        ),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text1.text1('NTRP Rating'),

                            Text2.text2('5.0'),
                          ],
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text1.text1('Preferred Distance from Count'),

                            Text2.text2('15 miles'),
                          ],
                        ),
                        SizedBox(
                          height:  AppFontSize.font20,
                        ),
                        Text1.text1('You Festance form Court'),
                        SizedBox(
                          height:  AppFontSize.font20,
                        ),
                        ReadMoreText(
                          "Travelling the world is an exhilarating experience, but there are certain destinations where every traveller needs to be cautious due to the prevalence of crime, civil unrest, terrorism among other dangerous factors. If you're planning a foreign holiday, one of the most important things to check is whether the destination",
                          trimLines: 3,
                          style: TextStyle(
                              fontSize:  AppFontSize.font16,
                              color: AppColor.black),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          lessStyle: TextStyle(
                              color: AppColor.skyBlue,
                              fontSize:  AppFontSize.font16,
                              fontWeight: FontWeight.bold),
                          moreStyle: TextStyle(
                              color: AppColor.skyBlue,
                              fontSize:  AppFontSize.font16,
                              fontWeight: FontWeight.bold),
                        ),


                      ]),
                ),
              ),
            ))
      ]),
    ));
  }




  }
