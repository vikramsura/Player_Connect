import 'package:flutter/material.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isemail = true;
  bool isphone = true;
  bool isappN = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Notifications',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppFontSize.font20),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: AppFontSize.font20,
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Email',
                  style: TextStyle(
                      fontSize: AppFontSize.font16,
                      color: AppColor.blue,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  activeTrackColor: AppColor.skyBlue,
                  inactiveTrackColor: AppColor.white1,
                  inactiveThumbColor: AppColor.blue,
                  activeColor: AppColor.blue,
                  value: isemail,
                  onChanged: (value) {
                    setState(() {
                      isemail == true ? isemail = false : isemail = true;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: AppFontSize.font20,
            ),
            Card(
              child: ListTile(
                title: Text('Phone',
                    style: TextStyle(
                        fontSize: AppFontSize.font16,
                        color: AppColor.blue,
                        fontWeight: FontWeight.bold)),
                trailing: Switch(
                  activeTrackColor: AppColor.skyBlue,
                  inactiveTrackColor: AppColor.white1,
                  inactiveThumbColor: AppColor.blue,
                  activeColor: AppColor.blue,
                  value: isphone,
                  onChanged: (value) {
                    setState(() {
                      isphone == true ? isphone = false : isphone = true;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: AppFontSize.font20,
            ),
            Card(
              child: ListTile(
                title: Text('App Notifications',
                    style: TextStyle(
                        fontSize: AppFontSize.font16,
                        color: AppColor.blue,
                        fontWeight: FontWeight.bold)),
                trailing: Switch(
                  activeTrackColor: AppColor.skyBlue,
                  inactiveTrackColor: AppColor.white1,
                  inactiveThumbColor: AppColor.blue,
                  activeColor: AppColor.blue,
                  value: isappN,
                  onChanged: (value) {
                    setState(() {
                      isappN == true ? isappN = false : isappN = true;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
