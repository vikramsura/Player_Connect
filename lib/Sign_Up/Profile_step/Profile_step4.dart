import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/provider_data/sign_up.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/ntrp_rating_dialog_box.dart';
import 'package:playerconnect/Sign_Up/Profile_step/Profile_step5.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:provider/provider.dart';

class Step_four extends StatefulWidget {
  const Step_four({Key? key}) : super(key: key);

  @override
  State<Step_four> createState() => _Step_fourState();
}

class _Step_fourState extends State<Step_four> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSignUp>(
      builder: (context, provider, child) {
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
                            Image.asset(
                              'assets/images/appLogin.png',
                              height: AppFontSize.font60,
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Text(
                              "Do you have UTR game",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.blue,
                                  fontSize: AppFontSize.font14),
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
                              'Do you a have UTR Rating?',
                              style: TextStyle(
                                fontSize: AppFontSize.font14,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: AppFontSize.font150,
                                    child: RadioListTile(
                                      title: Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontSize: AppFontSize.font14,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      activeColor: AppColor.skyBlue,
                                      value: true,
                                      groupValue: provider.isUtr,
                                      onChanged: (value) {
                                        provider.isUtr = value as bool;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: AppFontSize.font150,
                                    child: RadioListTile(
                                      title: Text(
                                        'No',
                                        style: TextStyle(
                                          fontSize: AppFontSize.font14,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      activeColor: AppColor.skyBlue,
                                      value: false,
                                      groupValue: provider.isUtr,
                                      onChanged: (value) {
                                        provider.isUtr = value as bool;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            provider.isUtr == true
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'UTR Rating ',
                                        style: TextStyle(
                                          fontSize: AppFontSize.font14,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                          '${provider.utrRating.toStringAsFixed(1)}'),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        'NTRP Rating ',
                                        style: TextStyle(
                                          fontSize: AppFontSize.font14,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return NtrpDialogBoxWidget();
                                              });
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              'assets/iconImage/helpIconImg.png'),
                                          height: AppFontSize.font20,
                                          width: AppFontSize.font20,
                                        ),
                                      ),
                                      Text(
                                        'Not sure what my rating is      ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.white1,
                                            fontSize: AppFontSize.font14),
                                      ),
                                      Text(
                                          '${provider.ntrpRating.toStringAsFixed(1)}'),
                                    ],
                                  ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            provider.isUtr == true
                                ? Slider(
                                    activeColor: AppColor.blue,
                                    thumbColor: AppColor.black,
                                    min: 0.0,
                                    max: 16.5,
                                    value: provider.utrRating,
                                    onChanged: (value) {
                                      setState(() {
                                        provider.utrRating = value;
                                      });
                                    },
                                  )
                                : Slider(
                                    activeColor: AppColor.blue,
                                    thumbColor: AppColor.black,
                                    min: 0.0,
                                    max: 5.0,
                                    value: provider.ntrpRating,
                                    onChanged: (value) {
                                      setState(() {
                                        provider.ntrpRating = value;
                                      });
                                    },
                                  ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Maximum Driving Distance ',
                                  style: TextStyle(
                                    fontSize: AppFontSize.font14,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                    '${provider.DrivingDistance.toStringAsFixed(1)}'),
                              ],
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Slider(
                              activeColor: AppColor.blue,
                              thumbColor: AppColor.black,
                              min: 0.0,
                              max: 50.0,
                              value: provider.DrivingDistance,
                              onChanged: (value) {
                                setState(() {
                                  provider.DrivingDistance = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Text(
                              'Your Desired Patner',
                              style: TextStyle(
                                fontSize: AppFontSize.font14,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: AppFontSize.font10,
                            ),
                            TextField(
                              controller: provider.desiredController,
                              maxLines: 5,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: 'Write something ....',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppFontSize.font20))),
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
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
                                    if (provider.desiredController.text
                                        .trim()
                                        .isEmpty) {
                                      AppMassage.buildShowSnackBar(context,
                                          'Please enter your desired patner');
                                    } else {
                                      progressValue = 5;
                                      progressValu = 01;

                                      setState(() {});
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Step_five(),
                                          ));
                                    }
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
      },
    );
  }
}
