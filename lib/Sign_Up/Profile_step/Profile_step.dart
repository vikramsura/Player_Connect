import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Sign_Up/Profile_step/Profile_step2.dart';
import 'package:playerconnect/provider_data/sign_up.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';

class Pofile_step extends StatefulWidget {
  const Pofile_step({Key? key}) : super(key: key);

  @override
  State<Pofile_step> createState() => Pofile_stepState();
}

class Pofile_stepState extends State<Pofile_step> {
  @override
  void initState() {
    Provider.of<ProviderSignUp>(context, listen: false).initCountry(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSignUp>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
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
                          Text(
                            'Complete Your Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue,
                                fontSize: AppFontSize.font16),
                          ),
                          SizedBox(
                            height: AppFontSize.font20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  minHeight: AppFontSize.font8,
                                  color: AppColor.skyBlue,
                                  backgroundColor: AppColor.white1,
                                  value: progressValu,
                                ),
                              ),
                              SizedBox(
                                width: AppFontSize.font10,
                              ),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: progressValue.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppFontSize.font14,
                                        color: AppColor.blue)),
                                TextSpan(text: (' /5')),
                              ]))
                            ],
                          ),
                          SizedBox(
                            height: AppFontSize.font20,
                          ),
                          Row(
                            children: [
                              provider.file == null
                                  ? Container(
                                      height: AppFontSize.font100,
                                      width: AppFontSize.font100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppFontSize.font16),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/profile.png'))),
                                    )
                                  : Container(
                                      height: AppFontSize.font100,
                                      width: AppFontSize.font100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppFontSize.font16),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  FileImage(provider.file!))),
                                    ),
                              SizedBox(
                                width: AppFontSize.font20,
                              ),
                              InkWell(
                                onTap: () {
                                  provider.handleAttachmentPressed(
                                    context,
                                  );
                                },
                                child: Text(
                                  'Upload Profile Photo',
                                  style: TextStyle(
                                      fontSize: AppFontSize.font14,
                                      color: AppColor.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppFontSize.font20,
                          ),
                          Text(
                            'First Name',
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
                              controller: provider.firstController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  counterText: "",
                                  hintText: 'John',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppFontSize.font20))),
                            ),
                          ),
                          SizedBox(
                            height: AppFontSize.font20,
                          ),
                          Text(
                            'Last Name',
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
                              controller: provider.lastController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  counterText: "",
                                  hintText: 'Adams',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppFontSize.font20))),
                            ),
                          ),
                          SizedBox(
                            height: AppFontSize.font20,
                          ),
                          Text(
                            'Phone Number',
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
                              controller: provider.phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  prefixIcon: Container(
                                    width: AppFontSize.font60,
                                    child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            provider.showCountryPicker(context);
                                          },
                                          child: Text(
                                      provider.codeController,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                            fontSize: AppFontSize.font16),
                                    ),
                                        )),
                                  ),
                                  counterText: "",
                                  hintText: ' 00000 00000',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppFontSize.font20))),
                            ),
                          ),
                          SizedBox(
                            height: AppFontSize.font20,
                          ),
                          Text(
                            'Text area',
                            style: TextStyle(
                              fontSize: AppFontSize.font14,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: AppFontSize.font20,
                          ),
                          TextField(
                            controller: provider.textController,
                            maxLines: 5,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Write something about you',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppFontSize.font20))),
                          ),
                          SizedBox(
                            height: AppFontSize.font20,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (provider.file == null) {
                                  AppMassage.buildShowSnackBar(
                                      context, 'Please upload photo');
                                } else if (provider.firstController.text
                                    .trim()
                                    .isEmpty) {
                                  AppMassage.buildShowSnackBar(
                                      context, 'Please enter your first name');
                                } else if (provider.lastController.text
                                    .trim()
                                    .isEmpty) {
                                  AppMassage.buildShowSnackBar(
                                      context, 'Please enter your last name');
                                } else if (provider.phoneController.text
                                    .trim()
                                    .isEmpty) {
                                  AppMassage.buildShowSnackBar(context,
                                      'Please enter your phone number');
                                } else if (provider.textController.text
                                    .trim()
                                    .isEmpty) {
                                  AppMassage.buildShowSnackBar(
                                      context, 'Please enter your text area');
                                } else {
                                  progressValue = 2;
                                  progressValu = 0.4;
                                  setState(() {});
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Step_two(),
                                      ));
                                }
                              },
                              child: AppButton.appButton(
                                context,
                                'CONTINUE',
                                AppColor.blue,
                                AppColor.white,
                                MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                        ]))),
          ),
        );
      },
    );
  }
}
