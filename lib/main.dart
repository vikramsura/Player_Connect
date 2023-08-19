import 'package:flutter/material.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Get_Started/get_started.dart';
import 'package:playerconnect/Sign_Up/Profile_step/Profile_step3.dart';

import 'shared/constant/font_sizes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
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
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Started(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppFontSize.font200,
              ),
              Center(child: Image.asset('assets/images/splash.png',width: AppFontSize.font300)),
              SizedBox(
                height: AppFontSize.font200,
              ),
              Text("from",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppFontSize.font16)),
              SizedBox(
                height: AppFontSize.font20,
              ),
              Center(child: Image.asset('assets/images/splashCoach.png',width:AppFontSize.font200,)),
            ]),
      ),
    );
  }
}
