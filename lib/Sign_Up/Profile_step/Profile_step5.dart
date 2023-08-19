import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Sign_Up/Connect/Connrct_with.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/player_style_dialog_box.dart';

import '../../shared/constant/appColors.dart';

class Step_five extends StatefulWidget {
  const Step_five({Key? key}) : super(key: key);

  @override
  State<Step_five> createState() => _Step_fiveState();
}

class _Step_fiveState extends State<Step_five> {
  TextEditingController _controller = TextEditingController();
  bool isdominant = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          controller: _controller,
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
                groupValue: isdominant,
                onChanged: (value) {
                  setState(() {
                    isdominant = value as bool;
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
                groupValue: isdominant,
                onChanged: (value) {
                  setState(() {
                    isdominant = value as bool;
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
                if (_controller.text.trim().isEmpty) {
                  AppMassage.buildShowSnackBar(
                      context, 'Please enter your playing style');
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Connect(),
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
      ]),
    ))));
  }
}
