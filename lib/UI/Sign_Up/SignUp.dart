import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/UI/Login/Login.dart';
import 'package:playerconnect/UI/Sign_Up/Thank_you.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/provider_data/login_provider.dart';
import 'package:playerconnect/provider_data/sign_up.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/privacy_policy_dialog_box.dart';
import 'package:playerconnect/shared/dialog_boxes/terms_condition_dialog_box.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

//login
class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSignUp>(builder: (context, provider, child) {
      return  SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: AppFontSize.font20,
                ),
                Image.asset('assets/images/appLogin.png',height: AppFontSize.font60,),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: ('Sign '),
                            style: TextStyle(
                                fontSize: AppFontSize.font35,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue)),
                        TextSpan(
                            text: ('Up'),
                            style: TextStyle(
                                fontSize: AppFontSize.font35,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blue))
                      ],
                    )),
                SizedBox(
                  height:AppFontSize.font20,
                ),
                Text('Email',style: TextStyle(
                  fontSize: AppFontSize.font14,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(
                  height: AppFontSize.font10,
                ),
                Container(
                  height: AppFontSize.font50,
                  child: TextField(
                    controller:provider.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter you email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppFontSize.font20))),
                  ),
                ),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                Text('Password',style: TextStyle(
                  fontSize: AppFontSize.font14,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(
                  height: AppFontSize.font10,
                ),
                Container(
                  height: AppFontSize.font50,
                  child: TextField(
                    controller:provider.passwordController,
                    obscureText:provider.isShowPassword,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                           provider.isShowPassword == true
                                ? provider.isShowPassword = false
                                :provider.isShowPassword = true;

                            setState(() {});
                          },
                          child: Icon(
                            Icons.remove_red_eye_sharp,
                          ),
                        ),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppFontSize.font20))),
                  ),
                ),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: ('Read '),
                    style: TextStyle(
                      fontSize: AppFontSize.font14,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                      text: ('Term & Condition '),
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: AppFontSize.font14,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return TermsConditionDialogBoxWidget(btn_Name: 'AGREE',);
                              });
                        }),
                  TextSpan(
                      text: ('& '),
                      style: TextStyle(
                        fontSize: AppFontSize.font14,
                        color: AppColor.black,
                        fontWeight: FontWeight.w400,
                      )),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return PrivacyPolicyDialogBoxWidget(btnName: 'AGREE',);
                              });
                        },
                      text: ('Privacy Policy '),
                      style: TextStyle(
                        fontSize: AppFontSize.font14,
                        color: AppColor.blue,
                        fontWeight: FontWeight.w400,
                      )),
                ])),
                SizedBox(
                  height: AppFontSize.font30,
                ),
                InkWell(
                    onTap: () {
                      if (provider.emailController.text.trim().isEmpty) {
                        AppMassage.buildShowSnackBar(
                            context, "Please enter Email");
                      } else if (provider.passwordController.text.trim().isEmpty) {
                        AppMassage.buildShowSnackBar(
                            context, "Please enter Password");
                      } else if (provider.passwordController.text.trim().length < 8) {
                        AppMassage.buildShowSnackBar(
                            context, "Please enter min 8 Digit Password");
                      } else {
                        AppMassage.buildShowSnackBar(
                            context, "SignUp Successfully...");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Thank_you(),
                            ));
                      }
                    },
                    child: AppButton.appButton(
                      context,
                      'SIGN UP',
                      AppColor.blue,
                      AppColor.white,
                      MediaQuery.of(context).size.width,
                    )),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: AppColor.white1,
                      height: AppFontSize.font4,
                      width:AppFontSize.font50,
                    ),
                    Text(
                      "Or Singn Up With Social media",
                      style: TextStyle(color: AppColor.white1),
                    ),
                    Container(
                      color: AppColor.white1,
                      height: AppFontSize.font4,
                      width: AppFontSize.font50,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/fbLogo.png',height: AppFontSize.font80,),
                    InkWell(
                      onTap: () {
                        Provider.of<ProviderLogin>(context,listen: false).signInWithGoogle(context);
                      },
                        child: Image.asset('assets/images/googleLogo.png',height: AppFontSize.font80,)),
                    Image.asset('assets/images/twitterLogo.png',height: AppFontSize.font80,),
                  ],
                ),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: ('Already an account  '),
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: AppFontSize.font16,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            },
                          text: ('LOGIN '),
                          style: TextStyle(
                              color: AppColor.blue,
                              fontSize: AppFontSize.font18,
                              fontWeight: FontWeight.w900)),
                    ])),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                ),
              ]),
            ),
          ),
        ),
      );
    },);

  }
}
