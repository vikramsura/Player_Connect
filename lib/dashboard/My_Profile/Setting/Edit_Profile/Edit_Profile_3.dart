import 'package:flutter/material.dart';
import 'package:playerconnect/dashboard/My_Profile/Setting/Edit_Profile/Edit_Profile_4.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Edit_Three extends StatefulWidget {
  const Edit_Three({Key? key}) : super(key: key);

  @override
  State<Edit_Three> createState() => _Edit_ThreeState();
}

class _Edit_ThreeState extends State<Edit_Three> {
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Text(
                      'Date of Brith',
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
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppFontSize.font20),
                          border: Border.all(color: AppColor.black)),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabled: false,
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            suffixIcon: Align(
                                widthFactor: 3,
                                child: Image.asset(
                                    'assets/iconImage/calendarIconImg.png',
                                    height: AppFontSize.font20,
                                    width: AppFontSize.font20,
                                    fit: BoxFit.cover)),
                            hintText: 'New Lamant, DE',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20))),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.75,
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
                                  builder: (context) => Edit_Four(),
                                ));
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
                  ]))),
    );
  }
}
