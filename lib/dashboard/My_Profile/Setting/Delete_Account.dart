import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Login/Login.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Delete_Account extends StatefulWidget {
  const Delete_Account({Key? key}) : super(key: key);

  @override
  State<Delete_Account> createState() => _Delete_AccountState();
}

class _Delete_AccountState extends State<Delete_Account> {
  TextEditingController _controller = TextEditingController();

  String? isOnTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Delete Account',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.font20),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: AppFontSize.font10,
            ),
            Text(
              "Once you account has been seleted, it's gone for dood. That includes you profile ahoto,connect,and conversation. ",
              style: TextStyle(
                fontSize: AppFontSize.font14,
                color: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: AppFontSize.font30,
            ),
            Text(
              'May I Know the reason?',
              style: TextStyle(
                fontSize: AppFontSize.font14,
                color: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            RadioListTile(
              activeColor: AppColor.skyBlue,
              title: Text(
                "Something was broken",
                style: TextStyle(
                  fontSize: AppFontSize.font14,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: "Something was broken",
              groupValue: isOnTap,
              onChanged: (value) {
                isOnTap = value as String;
                setState(() {});
              },
            ),
            RadioListTile(
              activeColor: AppColor.skyBlue,
              title: Text(
                "Not receiving playing opportunitirs",
                style: TextStyle(
                  fontSize: AppFontSize.font14,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: "Not receiving playing opportunitirs",
              groupValue: isOnTap,
              onChanged: (value) {
                isOnTap = value as String;
                setState(() {});
              },
            ),
            RadioListTile(
              activeColor: AppColor.skyBlue,
              title: Text(
                "I have privacy concerns",
                style: TextStyle(
                  fontSize: AppFontSize.font14,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: "I have privacy concerns",
              groupValue: isOnTap,
              onChanged: (value) {
                isOnTap = value as String;
                setState(() {});
              },
            ),
            RadioListTile(
              activeColor: AppColor.skyBlue,
              title: Text(
                "Other",
                style: TextStyle(
                  fontSize: AppFontSize.font14,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: "Other",
              groupValue: isOnTap,
              onChanged: (value) {
                isOnTap = value as String;
                setState(() {});
              },
            ),
            Text(
              'Other Reason',
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
              controller: _controller,
              maxLines: 5,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Write something about you',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppFontSize.font20))),
            ),
            SizedBox(
              height: AppFontSize.font20,
            ),
            InkWell(
              onTap: () {
                if (isOnTap == null) {
                  AppMassage.buildShowSnackBar(
                      context, 'Please select your reason');
                } else if (isOnTap == 'Other' &&
                    _controller.text.trim().isEmpty) {
                  AppMassage.buildShowSnackBar(
                      context, 'Please enter your reason');
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'DELETE ACCOUNT',
                        ),
                        content: Text(
                          'Are you sure you want to delete your account?',
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                AppMassage.buildShowSnackBar(
                                    context, 'Account delete Successfully');
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ));
                              },
                              child: Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No'))
                        ],
                      );
                    },
                  );
                }
              },
              child: AppButton.appButton(context, 'DELETE ACCOUNT', Colors.red,
                  AppColor.white, MediaQuery.of(context).size.width),
            )
          ]),
        ),
      ),
    );
  }
}
