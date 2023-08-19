import 'package:flutter/material.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double Distance = 0.0;
  double utrvalue = 0.0;
  double ntrpvalue = 0.0;
  bool isuntrp = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'FILTER',
          style: TextStyle(
              color: AppColor.blue, fontSize: AppFontSize.font20, fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(onTap: () {
                setState(() {
                  isuntrp=false;
                });
              },
                child: Column(
                  children: [
                    Text(
                      'UTR',
                      style: TextStyle(
                          color: isuntrp==false?AppColor.blue:AppColor.skyBlue,
                          fontSize: AppFontSize.font16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: AppFontSize.font10,
                    ),
                    Container(
                      color:isuntrp==false? AppColor.blue:AppColor.white1,
                      height:AppFontSize.font4,
                      width:AppFontSize.font100,
                    )
                  ],
                ),
              ),
              InkWell(onTap: () {
               setState(() {
                 isuntrp=true;
               });
              },
                child: Column(
                  children: [
                    Text(
                      'NTRP',
                      style: TextStyle(
                          color: isuntrp==true?AppColor.blue:AppColor.skyBlue,
                          fontSize: AppFontSize.font16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: AppFontSize.font10,
                    ),
                    Container(
                      color:isuntrp==true? AppColor.blue:AppColor.white1,
                      height: AppFontSize.font4,
                      width:AppFontSize.font100,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppFontSize.font20,
          ),
          isuntrp == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NTRP Rating',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: AppFontSize.font16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${ntrpvalue.toStringAsFixed(1)}',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: AppFontSize.font16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'UTR Rating',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: AppFontSize.font16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${utrvalue.toStringAsFixed(1)}',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: AppFontSize.font16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
          SizedBox(
            height: AppFontSize.font10,
          ),
          isuntrp == true
              ? Slider(
                  activeColor: AppColor.blue,
                  thumbColor: AppColor.black,
                  min: 0.0,
                  max: 5.0,
                  value: ntrpvalue,
                  onChanged: (value) {
                    ntrpvalue = value;
                    setState(() {});
                  },
                )
              : Slider(
                  activeColor: AppColor.blue,
                  thumbColor: AppColor.black,
                  min: 0.0,
                  max: 10.0,
                  value: utrvalue,
                  onChanged: (value) {
                    utrvalue = value;
                    setState(() {});
                  },
                ),
          SizedBox(
            height: AppFontSize.font20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Distance from me ',
                style: TextStyle(
                    color: AppColor.blue,
                    fontSize: AppFontSize.font16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${Distance.toStringAsFixed(1)} miles ',
                style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: AppFontSize.font20,
          ),
          Slider(
            activeColor: AppColor.blue,
            thumbColor: AppColor.black,
            min: 0.0,
            max: 15.0,
            value: Distance,
            onChanged: (value) {
              Distance = value;
              setState(() {});
            },
          ),
          SizedBox(
            height: AppFontSize.font20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton.appButton(
                context,
                'CANCEL',
                AppColor.skyBlue,
                AppColor.blue,
                MediaQuery.of(context).size.width / 3.5,
              ),
              AppButton.appButton(
                context,
                'FILTER',
                AppColor.blue,
                AppColor.white,
                MediaQuery.of(context).size.width / 3.5,
              )
            ],
          )
        ],
      ),
    );
  }
}
