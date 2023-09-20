import 'package:flutter/material.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/Setting/Edit_Profile/Edit_Profile_5.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/ntrp_rating_dialog_box.dart';

class Edit_Four extends StatefulWidget {
  const Edit_Four({Key? key}) : super(key: key);

  @override
  State<Edit_Four> createState() => _Edit_FourState();
}

class _Edit_FourState extends State<Edit_Four> {
  double utrRating = 0;
  double ntrpRating = 0;
  double DrivingDistance = 0.0;
  bool isUtr = true;

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
                        'Do you a have UTR Rating?',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppFontSize.font150,
                              child: RadioListTile(
                                title: Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontSize: AppFontSize.font14,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                activeColor: AppColor.skyBlue,
                                value: true,
                                groupValue: isUtr,
                                onChanged: (value) {
                                  isUtr = value as bool;
                                  setState(() {});
                                },
                              ),
                            ),
                            Container(
                              width: AppFontSize.font150,
                              child: RadioListTile(
                                title: Text(
                                  'No',
                                  style: TextStyle(
                                    fontSize: AppFontSize.font14,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                activeColor: AppColor.skyBlue,
                                value: false,
                                groupValue: isUtr,
                                onChanged: (value) {
                                  isUtr = value as bool;
                                  setState(() {});
                                },
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      isUtr == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'UTR Rating ',
                                  style: TextStyle(
                                    fontSize: AppFontSize.font14,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('${utrRating.toStringAsFixed(1)}'),
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  'NTRP Rating ',
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
                                          return NtrpDialogBoxWidget();
                                        });
                                  },
                                  child: Image(
                                    image: AssetImage(
                                        'assets/iconImage/helpIconImg.png'),
                                    height: AppFontSize.font20,
                                    width: AppFontSize.font20,
                                  ),
                                ),
                                Text(
                                  'Not sure what my rating is      ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.white1,
                                      fontSize: AppFontSize.font14),
                                ),
                                Text('${ntrpRating.toStringAsFixed(1)}'),
                              ],
                            ),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      isUtr == true
                          ? Slider(
                              activeColor: AppColor.blue,
                              thumbColor: AppColor.black,
                              min: 0.0,
                              max: 16.5,
                              value: utrRating,
                              onChanged: (value) {
                                setState(() {
                                  utrRating = value;
                                });
                              },
                            )
                          : Slider(
                              activeColor: AppColor.blue,
                              thumbColor: AppColor.black,
                              min: 0.0,
                              max: 5.0,
                              value: ntrpRating,
                              onChanged: (value) {
                                setState(() {
                                  ntrpRating = value;
                                });
                              },
                            ),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Maximum Driving Distance ',
                            style: TextStyle(
                              fontSize: AppFontSize.font14,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${DrivingDistance.toStringAsFixed(1)}'),
                        ],
                      ),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      Slider(
                        activeColor: AppColor.blue,
                        thumbColor: AppColor.black,
                        min: 0.0,
                        max: 50.0,
                        value: DrivingDistance,
                        onChanged: (value) {
                          setState(() {
                            DrivingDistance = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: AppFontSize.font20,
                      ),
                      Text(
                        'Your Desired Patner',
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
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText:
                                '"Lorem ipsum dolor sit amet, consectetur adipiscing elit,,sed do eiusmod tempor incididunt ut labore"',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20))),
                      ),
                      SizedBox(
                        height: AppFontSize.font20,
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
                                    builder: (context) => Edit_Five(),
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
                    ]))));
  }
}
