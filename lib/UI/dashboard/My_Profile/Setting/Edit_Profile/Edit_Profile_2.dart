import 'package:flutter/material.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/Setting/Edit_Profile/Edit_Profile_3.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Edit_Two extends StatefulWidget {
  const Edit_Two({Key? key}) : super(key: key);

  @override
  State<Edit_Two> createState() => _Edit_TwoState();
}

var isOn=3;

class _Edit_TwoState extends State<Edit_Two> {
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
                      'Gender',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: AppFontSize.font14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                             isOn=0;
                            });
                          },
                          child: Container(
                            height: AppFontSize.font100,
                            width: AppFontSize.font95,
                            decoration: BoxDecoration(
                                color: isOn==0
                                    ? AppColor.skyBlue
                                    : AppColor.white,
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/iconImage/mGenderImg.png',
                                  height: AppFontSize.font60,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFontSize.font16),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isOn=1;
                            });
                          },
                          child: Container(
                            height: AppFontSize.font100,
                            width: AppFontSize.font95,
                            decoration: BoxDecoration(
                                color: isOn == 1
                                    ? AppColor.skyBlue
                                    : AppColor.white,
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20)),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/iconImage/fGenderImg.png',
                                  height: AppFontSize.font60,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFontSize.font16),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isOn=2;
                            });
                          },
                          child: Container(
                            height: AppFontSize.font100,
                            width: AppFontSize.font95,
                            decoration: BoxDecoration(
                                color: isOn == 2
                                    ? AppColor.skyBlue
                                    : AppColor.white,
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20)),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/iconImage/oGenderImg.png',
                                  height: AppFontSize.font60,
                                ),
                                Text(
                                  'Other',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFontSize.font16),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Text(
                      'Date of Birth',
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.calendar_month),
                            counterText: "",
                            hintText: 'Select',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20))),
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: AppFontSize.font14,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: AppFontSize.font50,
                          width: AppFontSize.font150,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: "0' Feet",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppFontSize.font20))),
                          ),
                        ),
                        Container(
                          height: AppFontSize.font50,
                          width: AppFontSize.font150,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: "0'Inches",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppFontSize.font20))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppFontSize.font150,
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
                                  builder: (context) => Edit_Three(),
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
