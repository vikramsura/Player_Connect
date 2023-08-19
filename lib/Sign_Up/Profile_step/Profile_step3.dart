import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Sign_Up/Profile_step/Profile_step4.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Step_three extends StatefulWidget {
  const Step_three({Key? key}) : super(key: key);

  @override
  State<Step_three> createState() => _Step_threeState();
}

class _Step_threeState extends State<Step_three> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Image.asset('assets/images/appLogin.png',height: AppFontSize.font60,),
                        SizedBox(
                          height:AppFontSize.font20,
                        ),
                        Text(
                          "Where are you located?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.blue,
                              fontSize: AppFontSize.font16),
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                minHeight: AppFontSize.font8,
                                color: AppColor.skyBlue,
                                backgroundColor: AppColor.white1,
                                value: progressValu,
                              ),
                            ),
                            SizedBox(
                              width: AppFontSize.font10,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(text: progressValue.toString(),style: TextStyle(
                                fontSize: AppFontSize.font14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue)),
                              TextSpan(text: (' /5')),
                            ]))
                          ],
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Text('Find your city',style: TextStyle(
                          fontSize: AppFontSize.font14,
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppFontSize.font20),
                              border: Border.all(color: AppColor.black)),
                          child: TextField(
                            readOnly: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                enabled: false,
                                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                suffixIcon: Align(
                                    widthFactor: 3,
                                    child: Image.asset(
                                        'assets/iconImage/locationIconImg.png',
                                        height: AppFontSize.font20,
                                        width: AppFontSize.font20,
                                        fit: BoxFit.cover)),
                                hintText: 'Select',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppFontSize.font20))),
                          ),
                        ),
                        SizedBox(
                          height:  AppFontSize.font300,
                        ),
                        Row(
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
                                MediaQuery.of(context).size.width / 2.5,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                progressValue = 4;
                                progressValu = 0.8;

                                setState(() {});
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Step_four(),
                                    ));
                              },
                              child: AppButton.appButton(
                                context,
                                'NEXT',
                                AppColor.blue,
                                AppColor.white,
                                MediaQuery.of(context).size.width / 2.5,
                              ),
                            ),
                          ],
                        ),
                      ])))),
    );
  }
}
