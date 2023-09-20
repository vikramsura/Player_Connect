import 'package:flutter/material.dart';
import 'package:playerconnect/UI/Sign_Up/Profile_step/Profile_step3.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/provider_data/sign_up.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';

class Step_two extends StatefulWidget {
  const Step_two({Key? key}) : super(key: key);

  @override
  State<Step_two> createState() => Step_twoState();
}

class Step_twoState extends State<Step_two> {


  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSignUp>(builder: (context, provider, child) {
      return  SafeArea(
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
                        Image.asset(
                          'assets/images/appLogin.png',
                          height: AppFontSize.font60,
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Text(
                          "What's you Gender,Age,and Height",
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
                              TextSpan(
                                  text: progressValue.toString(),
                                  style: TextStyle(
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
                        Text(
                          'Gender',
                          style: TextStyle(
                              color: AppColor.blue,
                              fontSize: AppFontSize.font14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                 provider. gender = 0;
                                });
                              },
                              child: Container(
                                height: AppFontSize.font100,
                                width: AppFontSize.font95,
                                decoration: BoxDecoration(
                                    color:provider. gender == 0
                                        ? AppColor.skyBlue
                                        : AppColor.white,
                                    borderRadius: BorderRadius.circular(
                                        AppFontSize.font20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/iconImage/mGenderImg.png',
                                      height: AppFontSize.font60,
                                    ),
                                    Text(
                                      'Male',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppFontSize.font16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  provider. gender = 1;
                                });
                              },
                              child: Container(
                                height: AppFontSize.font100,
                                width: AppFontSize.font95,
                                decoration: BoxDecoration(
                                    color:provider. gender == 1
                                        ? AppColor.skyBlue
                                        : AppColor.white,
                                    borderRadius: BorderRadius.circular(
                                        AppFontSize.font20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/iconImage/fGenderImg.png',
                                      height: AppFontSize.font60,
                                    ),
                                    Text(
                                      'Female',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppFontSize.font16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  provider. gender = 2;
                                });
                              },
                              child: Container(
                                height: AppFontSize.font100,
                                width: AppFontSize.font95,
                                decoration: BoxDecoration(
                                    color: provider.gender == 2
                                        ? AppColor.skyBlue
                                        : AppColor.white,
                                    borderRadius: BorderRadius.circular(
                                        AppFontSize.font20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/iconImage/oGenderImg.png',
                                      height: AppFontSize.font60,
                                    ),
                                    Text(
                                      'Other',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppFontSize.font16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Text(
                          'Date of Birth',
                          style: TextStyle(
                            fontSize: AppFontSize.font14,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: AppFontSize.font10,
                        ),
                        Container(
                          height: AppFontSize.font50,
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              provider. selectDateTime(context);
                            },
                            controller: provider.dateController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_month),
                                counterText: "",
                                hintText: 'Select',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppFontSize.font20))),
                          ),
                        ),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Text(
                          'Height',
                          style: TextStyle(
                            fontSize: AppFontSize.font14,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: AppFontSize.font10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: AppFontSize.font50,
                              width: AppFontSize.font150,
                              child: TextField(
                                maxLength: 1,
                                controller: provider.feetController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "0' Feet",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppFontSize.font20))),
                              ),
                            ),
                            Container(
                              height: AppFontSize.font50,
                              width: AppFontSize.font150,
                              child: TextField(
                                maxLength: 2,
                                controller: provider.inchesController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "0'Inches",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppFontSize.font20))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppFontSize.font50,
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
                                if (provider.gender == null) {
                                  AppMassage.buildShowSnackBar(
                                      context, 'Please select gender');
                                } else if (provider.dateController.text.trim().isEmpty) {
                                  AppMassage.buildShowSnackBar(
                                      context, 'Please select date of birth');
                                } else if (provider.feetController.text.trim().isEmpty) {
                                  AppMassage.buildShowSnackBar(
                                      context, 'Please enter height in feet');
                                } else if (provider.inchesController.text
                                    .trim()
                                    .isEmpty) {
                                  AppMassage.buildShowSnackBar(
                                      context, "Please enter height in inches");
                                } else if (
                                double.parse(provider.inchesController.text)>11
                                )
                                {
                                  AppMassage.buildShowSnackBar(context, "Please enter valid height in inches");
                                }
                                else {

                                  progressValue = 3;
                                  progressValu = 0.6;

                                  setState(() {});
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Step_three(),
                                      ));
                                }},
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
                      ]))),
        ),
      );
    },);

  }



}
