import 'package:flutter/material.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/UI/Login/Login.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/Setting/Change_Password.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/Setting/Contact_Support.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/Setting/Delete_Account.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/Setting/Edit_Profile/Edit_Profile.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/Setting/Notifications.dart';
import 'package:playerconnect/provider_data/provider_setting.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/privacy_policy_dialog_box.dart';
import 'package:playerconnect/shared/dialog_boxes/terms_condition_dialog_box.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSetting>(builder: (context, provider, child) {
      return  Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Setting',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.blue),
            )),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Card(
              child: ListTile(
                  trailing: TextButton(
                      onPressed: () {},
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Edit_Profile(),
                              ));
                        },
                        child: Text(
                          'EDIT',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.skyBlue),
                        ),
                      )),
                  leading: CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/images/connectWithImg.png'),
                    radius: AppFontSize.font20,
                  ),
                  title: Text2.blue('John Isner')),
            ),
            buildCard("Notifications", 0),
            buildCard("Change PassWord", 1),
            buildCard("Contact Support", 2),
            buildCard("Sign Out", 3),
            Card(
              child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Delete_Account(),
                          ));
                    },
                    child: Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )),
              ),
            ),
            SizedBox(height: AppFontSize.font150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return TermsConditionDialogBoxWidget(
                          btn_Name: 'CLOSE',
                        );
                      },
                    );
                  },
                  child: Text(
                    'Terms & Condition',
                    style: TextStyle(
                        color: AppColor.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.font16),
                  ),
                ),
                SizedBox(
                  width: AppFontSize.font20,
                ),
                CircleAvatar(
                  radius: AppFontSize.font6,
                ),
                SizedBox(
                  width: AppFontSize.font20,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PrivacyPolicyDialogBoxWidget(btnName: 'CLOSE');
                      },
                    );
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        color: AppColor.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.font16),
                  ),
                )
              ],
            )
          ]),
        ),
      );
    },);

  }

  Widget buildCard(text, index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: ListTile(
            onTap: () {
              index == 0
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notifications(),
                      ))
                  : index == 1
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Change_Password(),
                          ))
                      : index == 2
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Contact_Support(),
                              ))
                          : showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Sign Out',
                                  ),
                                  content: Text(
                                    'Are you sure you want to Sign Out?',
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          LocalDataSaver.setUserLogin(false);

                                          AppMassage.buildShowSnackBar(context, 'Sign Out Successfully');
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Login(),
                                              ));
                                        },
                                        child: Text('Yes')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('No'))
                                  ],
                                );
                              },
                            );
            },
            trailing: index == 3 ? SizedBox() : Icon(Icons.navigate_next),
            title: Text2.blue(text)),
      ),
    );
  }
}
