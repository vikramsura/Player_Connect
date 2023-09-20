import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/UI/Get_Started/get_started.dart';
import 'package:playerconnect/shared/BottomNavigationBar.dart';
import 'package:playerconnect/provider_data/chat_provider.dart';
import 'package:playerconnect/provider_data/delete_user_account.dart';
import 'package:playerconnect/provider_data/forgoat_password.dart';
import 'package:playerconnect/provider_data/login_provider.dart';
import 'package:playerconnect/provider_data/profile_provider.dart';
import 'package:playerconnect/provider_data/provider_connect.dart';
import 'package:playerconnect/provider_data/provider_players.dart';
import 'package:playerconnect/provider_data/provider_setting.dart';
import 'package:playerconnect/provider_data/sign_up.dart';
import 'package:playerconnect/provider_data/view_provider.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';
import 'package:provider/provider.dart';

import 'shared/constant/font_sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProviderSignUp();
      },
      child: ChangeNotifierProvider(
        create: (context) {
          return ProviderLogin();
        },
        child: ChangeNotifierProvider(
          create: (context) {
            return ProviderSetting();
          },
          child: ChangeNotifierProvider(
            create: (context) {
              return ProviderChat();
            },
            child: ChangeNotifierProvider(
              create: (context) {
                return ProviderPlayers();
              },
              child: ChangeNotifierProvider(
                create: (context) {
                  return ProviderConnect();
                },
                child: ChangeNotifierProvider(
                  create: (context) {
                    return ProviderProfile();
                  },
                  child: ChangeNotifierProvider(
                    create: (context) {
                      return ProviderPlayerView();
                    },
                    child: ChangeNotifierProvider(
                      create: (context) {
                        return ProviderDeleteUserAccount();
                      },
                      child: ChangeNotifierProvider(
                        create: (context) {
                          return ProviderForgoatPassword();
                        },
                        child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: 'Flutter Demo',
                          theme: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                                seedColor: Colors.deepPurple),
                            useMaterial3: true,
                          ),
                          home: const MyHomePage(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: AppFontSize.font200,
          ),
          Center(
              child: Image.asset('assets/images/splash.png',
                  width: AppFontSize.font300)),
          SizedBox(
            height: AppFontSize.font200,
          ),
          Text("from",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: AppFontSize.font16)),
          SizedBox(
            height: AppFontSize.font20,
          ),
          Center(
              child: Image.asset(
            'assets/images/splashCoach.png',
            width: AppFontSize.font200,
          )),
        ]),
      ),
    );
  }

  void getLoginData() async {
    await LocalDataSaver.getUserLogin().then((value) {
      if (value == true) {
        getUserDetails();
        Future.delayed(Duration(seconds: 4), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Bottombar(),
              ));
        });
      } else {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Started(),
              ));
        });
      }
    });
  }
}
