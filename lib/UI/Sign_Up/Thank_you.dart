import 'package:flutter/material.dart';
import 'package:playerconnect/UI/Sign_Up/Profile_step/Profile_step.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';


class Thank_you extends StatefulWidget {
  const Thank_you({Key? key}) : super(key: key);

  @override
  State<Thank_you> createState() => _Thank_youState();
}

class _Thank_youState extends State<Thank_you> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
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
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                            text: ('Thank '),
                            style: TextStyle(
                                fontSize: AppFontSize.font35,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue)),
                        TextSpan(
                            text: ('you'),
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
                      'You account has beed successfully verified',
                      style: TextStyle(fontSize: AppFontSize.font18),
                    ),
                    SizedBox(
                      height: AppFontSize.font10,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pofile_step()),
                              (route) => false);
                        },
                        child: Text(
                          'PROCEED TO YOUR ACCOUNT',
                          style: TextStyle(
                              fontSize: AppFontSize.font18,
                              color: AppColor.blue,
                              fontWeight: FontWeight.bold),
                        )),
                  ]))),
    );
  }
}
