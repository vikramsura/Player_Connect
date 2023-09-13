// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/BottomNavigationBar.dart';
import 'package:playerconnect/Login/Forgot_password/Forgot_password.dart';
import 'package:playerconnect/Sign_Up/SignUp.dart';
import 'package:playerconnect/dashboard/Players/Players.dart';
import 'package:playerconnect/provider_data/login_provider.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:http/http.dart' as http;
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';

import '../All_Data.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderLogin>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
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
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: ('Log '),
                              style: TextStyle(
                                  fontSize: AppFontSize.font35,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.blue)),
                          TextSpan(
                              text: ('In'),
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
                        'Email',
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
                          controller: provider.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Enter you email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppFontSize.font20))),
                        ),
                      ),
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
                          controller: provider.passwordController,
                          obscureText: provider.isShowPassword,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  provider.isShowPassword == true
                                      ? provider.isShowPassword = false
                                      : provider.isShowPassword = true;

                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.remove_red_eye_sharp,
                                ),
                              ),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppFontSize.font20))),
                        ),
                      ),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Forgot_password(),
                                    ));
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                    fontSize: AppFontSize.font16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blue),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      InkWell(
                          onTap: () {
                            if (provider.emailController.text.trim().isEmpty) {
                              AppMassage.buildShowSnackBar(
                                  context, "Please enter Email");
                            } else if (provider.passwordController.text
                                .trim()
                                .isEmpty) {
                              AppMassage.buildShowSnackBar(
                                  context, "Please enter Password");
                            } else if (provider.passwordController.text
                                    .trim()
                                    .length <
                                8) {
                              AppMassage.buildShowSnackBar(
                                  context, "Please enter min 8 Digit Password");
                            } else {
                              provider.getLogin(context);
                              // AppMassage.buildShowSnackBar(
                              //     context, "Login Successfully...");
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => Bottombar(),
                              //     ));
                            }
                          },
                          child: AppButton.appButton(
                            context,
                            'LOGIN',
                            AppColor.blue,
                            AppColor.white,
                            MediaQuery.of(context).size.width,
                          )),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: AppColor.white1,
                            height: AppFontSize.font4,
                            width: AppFontSize.font50,
                          ),
                          Text(
                            "Or Sign In With Social media",
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
                          Image.asset(
                            'assets/images/fbLogo.png',
                            height: AppFontSize.font80,
                          ),
                          InkWell(
                              onTap: () {
                                provider.signInWithGoogle(context);
                              },
                              child: Image.asset(
                                'assets/images/googleLogo.png',
                                height: AppFontSize.font80,
                              )),
                          Image.asset(
                            'assets/images/twitterLogo.png',
                            height: AppFontSize.font80,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: ('New Member  '),
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: AppFontSize.font16,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                            text: ('Sign up '),
                            style: TextStyle(
                                color: AppColor.blue,
                                fontSize: AppFontSize.font18,
                                fontWeight: FontWeight.w900)),
                      ])),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
