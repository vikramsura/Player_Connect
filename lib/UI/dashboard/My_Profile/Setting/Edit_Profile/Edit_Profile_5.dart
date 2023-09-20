import 'package:flutter/material.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/Setting/Sittings.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/player_style_dialog_box.dart';

class Edit_Five extends StatefulWidget {
  const Edit_Five({Key? key}) : super(key: key);

  @override
  State<Edit_Five> createState() => _Edit_FiveState();
}

class _Edit_FiveState extends State<Edit_Five> {

  bool isdominant = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Edit Profile',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: AppFontSize.font20),
            )),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              height: AppFontSize.font300,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ));
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
        )));
  }
}
