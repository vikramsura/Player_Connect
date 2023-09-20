import 'package:flutter/material.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/provider_data/provider_setting.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';


class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {



  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSetting>(builder: (context, provider, child) {
      return  Scaffold(
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
                controller: provider.oldPasswordController,
                obscureText:provider. isCurrentPassword,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        provider.isCurrentPassword == true
                            ? provider.isCurrentPassword = false
                            : provider.isCurrentPassword = true;

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
                controller: provider.newPasswordController,
                obscureText:provider. isNewPassword,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        provider.isNewPassword == true
                            ? provider.isNewPassword = false
                            : provider.isNewPassword = true;

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
                controller: provider.confirmPasswordController,
                obscureText: provider.isConfirmPassword,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        provider.isConfirmPassword == true
                            ? provider.isConfirmPassword = false
                            : provider.isConfirmPassword = true;

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
            InkWell(onTap: () {
              if(provider.oldPasswordController.text.trim().isEmpty){
                AppMassage.buildShowSnackBar(context, 'Please Enter Current Password');
              }else if(provider.newPasswordController.text.trim().isEmpty){
                AppMassage.buildShowSnackBar(context, 'Please Enter New Password');
              }else if (provider.newPasswordController.text.trim().length<8){
                AppMassage.buildShowSnackBar(context, 'Please enter min 8 Digit Password');
              }else if(provider.confirmPasswordController.text.trim().isEmpty){
                AppMassage.buildShowSnackBar(context, 'Please Enter Confirm Password');
              }else if (provider.confirmPasswordController.text.trim().length<8){
                AppMassage.buildShowSnackBar(context, 'Please enter min 8 Digit Password');
              }else if (provider.newPasswordController.text.trim()!=provider.confirmPasswordController.text.trim()){
                AppMassage.buildShowSnackBar(context, 'Confirm Password Not Matched');
              }else{
                provider.updatePassword(context);
              }
            },
              child: AppButton.appButton(context, 'SEND', AppColor.blue, AppColor.white,
                  MediaQuery.of(context).size.width),
            )
          ]),
        ),
      );
    },);

  }
}
