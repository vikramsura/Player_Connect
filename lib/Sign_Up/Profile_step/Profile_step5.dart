import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Login/Login.dart';
import 'package:playerconnect/Sign_Up/Connect/Connrct_with.dart';
import 'package:playerconnect/provider_data/sign_up.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/player_style_dialog_box.dart';
import 'package:provider/provider.dart';

import '../../shared/constant/appColors.dart';

class Step_five extends StatefulWidget {
  const Step_five({Key? key}) : super(key: key);

  @override
  State<Step_five> createState() => _Step_fiveState();
}

class _Step_fiveState extends State<Step_five> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSignUp>(
      builder: (context, provider, child) {
        return SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
                    child: Padding(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              "aTell us more about your game?",
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
            Row(
              children: [
                Text(
                  'Playing Style  ',
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
                        return PlayerStyleDialogBoxWidget();
                      },
                    );
                  },
                  child: Image(
                    image: AssetImage('assets/iconImage/helpIconImg.png'),
                    height: AppFontSize.font20,
                    width: AppFontSize.font20,
                  ),
                ),
                Text(
                  '  Find out my playing style',
                  style: TextStyle(
                    fontSize: AppFontSize.font14,
                    color: AppColor.white1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppFontSize.font20,
            ),
            TextField(
              controller: provider.playingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Playing style',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppFontSize.font20))),
            ),
            SizedBox(
              height: AppFontSize.font20,
            ),
            Text(
              'Dominant Hand',
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
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text(
                      'Left',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.font16),
                    ),
                    activeColor: AppColor.skyBlue,
                    value: true,
                    groupValue: provider.isdominant,
                    onChanged: (value) {
                      setState(() {
                        provider.isdominant = value as bool;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text(
                      'Right',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.font16),
                    ),
                    activeColor: AppColor.skyBlue,
                    value: false,
                    groupValue: provider.isdominant,
                    onChanged: (value) {
                      setState(() {
                        provider.isdominant = value as bool;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppFontSize.font180,
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
                    if (provider.playingController.text.trim().isEmpty) {
                      AppMassage.buildShowSnackBar(
                          context, 'Please enter your playing style');

                    } else {
                      provider.setSignUpData(context);
                    }
                  },
                  child: AppButton.appButton(
                    context,
                    'DONE',
                    AppColor.blue,
                    AppColor.white,
                    MediaQuery.of(context).size.width / 2.5,
                  ),
                ),
              ],
            ),
          ]),
        ))));
      },
    );
  }
}
