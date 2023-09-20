import 'package:flutter/material.dart';
import 'package:playerconnect/UI/Login/Login.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class New_Password extends StatefulWidget {
  const New_Password({Key? key}) : super(key: key);

  @override
  State<New_Password> createState() => _New_PasswordState();
}

class _New_PasswordState extends State<New_Password> {
  TextEditingController _newpassword = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  bool isShowPassword = true;
  bool confirmPassword = true;

  @override
  Widget build(BuildContext context) {
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
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: ("New "),
                      style: TextStyle(
                          fontSize: AppFontSize.font35,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blue)),
                  TextSpan(
                      text: ('Password'),
                      style: TextStyle(
                          fontSize: AppFontSize.font35,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blue))
                ],
              )),
              SizedBox(
                height: AppFontSize.font20,
              ),
              Text(
                'Password',
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
                  obscureText: isShowPassword,
                  controller: _newpassword,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          isShowPassword == true
                              ? isShowPassword = false
                              : isShowPassword = true;

                          setState(() {});
                        },
                        child: Icon(
                          Icons.remove_red_eye_sharp,
                        ),
                      ),
                      counterText: "",
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppFontSize.font20))),
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
                  obscureText: confirmPassword,
                  controller: _confirmpassword,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          confirmPassword == true
                              ? confirmPassword = false
                              : confirmPassword = true;

                          setState(() {});
                        },
                        child: Icon(
                          Icons.remove_red_eye_sharp,
                        ),
                      ),
                      counterText: "",
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppFontSize.font20))),
                ),
              ),
              SizedBox(
                height: AppFontSize.font30,
              ),
              InkWell(
                onTap: () {
                  if (_newpassword.text.trim().isEmpty) {
                    AppMassage.buildShowSnackBar(
                        context, 'Please enter your password');
                  } else if (_newpassword.text.trim().length < 8) {
                    AppMassage.buildShowSnackBar(
                        context, "Please enter min 8 Digit Password");
                  } else if (_confirmpassword.text.trim().isEmpty) {
                    AppMassage.buildShowSnackBar(
                        context, 'Please enter your confirm password');
                  } else if (_confirmpassword.text.trim().toString() !=
                      _newpassword.text.trim().toString()) {
                    AppMassage.buildShowSnackBar(
                        context, 'Your password not matched');
                  } else {
                    AppMassage.buildShowSnackBar(
                        context, 'Password successfully changed');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  }
                },
                child: AppButton.appButton(
                  context,
                  'DONE',
                  AppColor.blue,
                  AppColor.white,
                  MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(
                height: AppFontSize.font150,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: ('Back to  '),
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: AppFontSize.font16,
                        fontWeight: FontWeight.w400)),
                TextSpan(
                    recognizer: TapAndPanGestureRecognizer()
                      ..onTapUp = (details) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    text: ('Login '),
                    style: TextStyle(
                        color: AppColor.blue,
                        fontSize: AppFontSize.font18,
                        fontWeight: FontWeight.bold)),
              ])),
            ]),
          ),
        ),
      ),
    );
  }
}
