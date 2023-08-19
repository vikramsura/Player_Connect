import 'package:flutter/material.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';

class TermsConditionDialogBoxWidget extends StatefulWidget {
  String btn_Name;
  TermsConditionDialogBoxWidget({Key? key,required this.btn_Name}) : super(key: key);

  @override
  State<TermsConditionDialogBoxWidget> createState() =>
      _TermsConditionDialogBoxWidgetState();
}

class _TermsConditionDialogBoxWidgetState
    extends State<TermsConditionDialogBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text("Terms & Conditions",
              style: TextStyle(color: AppColor.blue))),
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
            widget.btn_Name,
            AppColor.blue,
            AppColor.white,
            MediaQuery.of(context).size.width,
          ),
        )
      ],
    );
  }
}
