import 'package:flutter/material.dart';
import 'package:playerconnect/provider_data/provider_setting.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';

class Contact_Support extends StatefulWidget {
  const Contact_Support({Key? key}) : super(key: key);

  @override
  State<Contact_Support> createState() => _Contact_SupportState();
}

class _Contact_SupportState extends State<Contact_Support> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<ProviderSetting>(builder: (context, provider, child) {
      return  Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Contact Support',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: AppFontSize.font20),
            )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: AppFontSize.font20,
              ),
              Text(
                ' Dropdown Label',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: AppFontSize.font16),
              ),
              SizedBox(
                height: AppFontSize.font10,
              ),
              ExpansionTile(
                  title: Text(
                    'Select',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: AppFontSize.font16),
                  )),
              SizedBox(
                height: AppFontSize.font30,
              ),
              Text(
                ' Query',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: AppFontSize.font16),
              ),
              SizedBox(
                height: AppFontSize.font10,
              ),
              TextField(
                maxLines: 5,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,,sed do eiusmod tempor incididunt ut labore",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(AppFontSize.font20))),
              ),SizedBox(
                height: AppFontSize.font200,
              ),
              AppButton.appButton(context, 'SEND', AppColor.blue, AppColor.white,
                  MediaQuery.of(context).size.width)
            ]),
          ),
        ),
      );
    },);

  }
}
