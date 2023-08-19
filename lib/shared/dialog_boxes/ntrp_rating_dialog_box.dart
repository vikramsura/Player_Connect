
import 'package:flutter/material.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';

class NtrpDialogBoxWidget extends StatefulWidget {
  const NtrpDialogBoxWidget({Key? key}) : super(key: key);

  @override
  State<NtrpDialogBoxWidget> createState() => _NtrpDialogBoxWidgetState();
}

class _NtrpDialogBoxWidgetState extends State<NtrpDialogBoxWidget> {
  int? selected;
  List aaaaa = [
    "1.0",
    "1.5",
    "2.0",
    "2.5",
    "3.0",
    "3.5",
    "4.0",
    "4.5",
    "5.0",
    "5.5",
    "6.0",
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        InkWell(onTap: () {
          Navigator.pop(context);
        },
          child: AppButton.appButton(
      context,
      'CLOSE',
      AppColor.blue,
      AppColor.white,
      MediaQuery.of(context).size.width,
    ),
        ),],
      title: Center(child: Text('NTRP Rating')),
      titleTextStyle: TextStyle(
          color: AppColor.blue, fontSize: 20, fontWeight: FontWeight.bold),
      content: SingleChildScrollView(
        child: ListView.separated(
          key: Key('builder ${selected.toString()}'),
          itemCount: aaaaa.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: Key(index.toString()),
                    //attention
                    initiallyExpanded: index == selected,
                    childrenPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    onExpansionChanged: (value) {
                      if (value) {
                        selected = index;
                      } else {
                        selected = -1;
                      }
                      setState(() {});
                    },
                    children: [
                      Text(
                          "I have an ExpansionTile within my Drawer widget. When I expand this item, it automatically adds a divider line above and below. I want these divider lines permanently.So I'd either like to know how to show the ExpansionTile's divider lines always (expanded and unexpanded), or I can add my own divider lines and tell the ExpansionTile to never show divider lines")
                    ],
                    title: Text('NTRP'),
                    leading: Container(
                        decoration: BoxDecoration(
                            color:index==selected? AppColor.blue:AppColor.skyBlue,
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height / 25,
                        width: MediaQuery.of(context).size.width / 6,
                        child: Center(
                            child: Text(
                          aaaaa[index],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:index==selected?AppColor.white: AppColor.blue),
                        ))),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: AppColor.white1,
            );
          },
        ),
      ),
    );
  }
}
