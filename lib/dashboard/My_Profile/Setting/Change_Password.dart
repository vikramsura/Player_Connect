import 'package:flutter/material.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  bool isCurrentPassword = true;
  bool isNewPassword = true;
  bool isConfirmPassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Change Password',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppFontSize.font20),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: AppFontSize.font20,
          ),
          Text(
            'Current Password',
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
              obscureText: isCurrentPassword,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      isCurrentPassword == true
                          ? isCurrentPassword = false
                          : isCurrentPassword = true;

                      setState(() {});
                    },
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                    ),
                  ),
                  counterText: "",
                  hintText: 'Current Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppFontSize.font20))),
            ),
          ),
          SizedBox(
            height: AppFontSize.font20,
          ),
          Text(
            'New Password',
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
              obscureText: isNewPassword,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      isNewPassword == true
                          ? isNewPassword = false
                          : isNewPassword = true;

                      setState(() {});
                    },
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                    ),
                  ),
                  counterText: "",
                  hintText: 'New Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppFontSize.font20))),
            ),
          ),
          SizedBox(
            height: AppFontSize.font20,
          ),
          Text(
            'Confirm Password',
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
              obscureText: isConfirmPassword,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      isConfirmPassword == true
                          ? isConfirmPassword = false
                          : isConfirmPassword = true;

                      setState(() {});
                    },
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                    ),
                  ),
                  counterText: "",
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppFontSize.font20))),
            ),
          ),
          SizedBox(
            height: AppFontSize.font200,
          ),
          AppButton.appButton(context, 'SEND', AppColor.blue, AppColor.white,
              MediaQuery.of(context).size.width)
        ]),
      ),
    );
  }
}
