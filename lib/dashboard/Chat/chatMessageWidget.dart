import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/Model_Class/chat_message_model.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';

import '../../shared/constant/appColors.dart';
import '../../shared/constant/font_sizes.dart';

class ChatMessageWidget extends StatelessWidget {
  final int index;
  final ChatMessageModel message;

  const ChatMessageWidget({
    Key? key,
    required this.index,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return message.sender.toString() == UserDetails.userID
        ?  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: Bubble(
              margin: BubbleEdges.only(
                  bottom: AppFontSize.font10),
              padding: BubbleEdges.all(AppFontSize.font4),
              alignment: Alignment.topRight,
              nipWidth: AppFontSize.font16,
              color: AppColor.greenAccent,
              nipHeight: AppFontSize.font10,
              nip: BubbleNip.rightTop,
              child:Text(message.message),
                 ),
        ),
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: Bubble(
              margin: BubbleEdges.only(
                  bottom: AppFontSize.font10),
              padding: BubbleEdges.all(AppFontSize.font4),
              alignment: Alignment.topLeft,
              nipWidth: AppFontSize.font16,
              color: Colors.black26,
              nipHeight: AppFontSize.font10,
              nip: BubbleNip.leftTop,
              child:Text(message.message)
             ),
        ),
      ],
    );;
  }
}
