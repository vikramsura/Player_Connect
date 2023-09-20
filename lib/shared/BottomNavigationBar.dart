import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/UI/dashboard/Chat/Chat.dart';
import 'package:playerconnect/UI/dashboard/Connect_Request/Request.dart';
import 'package:playerconnect/UI/dashboard/My_Profile/My_Profile.dart';
import 'package:playerconnect/UI/dashboard/Players/Players.dart';
import 'package:playerconnect/provider_data/chat_provider.dart';
import 'package:playerconnect/provider_data/profile_provider.dart';
import 'package:playerconnect/provider_data/provider_connect.dart';
import 'package:playerconnect/provider_data/provider_players.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:provider/provider.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({
    Key? key,
  }) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  var _currentIndex = 0;
  List AllData = [
    Players(),
    Chat(),
    Request(),
    My_Profil(),
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderPlayers>(context, listen: false).getPlayer();
    Provider.of<ProviderPlayers>(context, listen: false).recommendedPlayer(context);
    Provider.of<ProviderChat>(context, listen: false).getChat();
    Provider.of<ProviderConnect>(context, listen: false).getConnect();
    Provider.of<ProviderConnect>(context, listen: false).getConnectionRequest();
    Provider.of<ProviderProfile>(context, listen: false).getUserProfile();
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: AllData[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          selectedItemColor: AppColor.blue,
          unselectedItemColor: AppColor.skyBlue,
          unselectedLabelStyle: TextStyle(),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: AppColor.blue),
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Image(
                    height: MediaQuery.of(context).size.height / 25,
                    image: AssetImage('assets/images/appLogin.png')),
                label: 'Players'),
            BottomNavigationBarItem(
                icon: Image(height: MediaQuery.of(context).size.height / 25,
                    image: AssetImage('assets/btm/chat_n.png')),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: Image(
                    height: MediaQuery.of(context).size.height / 25,
                    image: AssetImage('assets/btm/connect_n.png')),
                label: 'Connect'),
            BottomNavigationBarItem(
                icon: Image(
                    height: MediaQuery.of(context).size.height / 25,
                    image: AssetImage('assets/btm/profile_n.png')),
                label: 'My Profile'),
          ]),
    ));
  }
}
