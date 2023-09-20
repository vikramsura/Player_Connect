import 'package:flutter/material.dart';
import 'package:playerconnect/UI/Login/Login.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/provider_data/forgoat_password.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';

class Forgot_password extends StatefulWidget {
  const Forgot_password({Key? key}) : super(key: key);

  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

class _Forgot_passwordState extends State<Forgot_password> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<ProviderForgoatPassword>(builder: (context, provider, child) {
      return  SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
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
                            text: ("Can't "),
                            style: TextStyle(
                                fontSize: AppFontSize.font35,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue)),
                        TextSpan(
                            text: ('Log In?'),
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blue))
                      ],
                    )),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                Text('Email', style: TextStyle(
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
                    controller: provider.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        counterText: "",
                        hintText: 'Enter you email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppFontSize.font20))),
                  ),
                ),
                SizedBox(
                  height: AppFontSize.font30,
                ),
                Center(
                  child: InkWell(onTap: () {
                    if(provider.emailController.text.trim().isEmpty){
                      AppMassage.buildShowSnackBar(context, 'Please enter your email');
                    }else{
                      provider.forgoatPassword(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => New_Password(),
                      //     ));
                    }},
                      child:  AppButton.appButton(context,'SEND',AppColor.blue,AppColor.white,MediaQuery.of(context).size.width,)
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
                              Navigator.pushReplacement(context,
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
    },);

  }
}
