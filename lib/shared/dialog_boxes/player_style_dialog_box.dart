// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';

class PlayerStyleDialogBoxWidget extends StatefulWidget {
  const PlayerStyleDialogBoxWidget({Key? key}) : super(key: key);

  @override
  State<PlayerStyleDialogBoxWidget> createState() => _PlayerStyleDialogBoxWidgetState();
}

class _PlayerStyleDialogBoxWidgetState extends State<PlayerStyleDialogBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
            "Playing Style",
            style: TextStyle(color: AppColor.blue),
          )),
      content: SingleChildScrollView(
        child: Text(
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantiu, totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto becatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit quia consequuntur magni  fugit, sed quia consequuntur mag dolores eos qui ration voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?"),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: AppButton.appButton(
            context,
            'CLOSE',
            AppColor.blue,
            AppColor.white,
            MediaQuery.of(context).size.width,
          ),
        )
      ],
    );
  }
}
