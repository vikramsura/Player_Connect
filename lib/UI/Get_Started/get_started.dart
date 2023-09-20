import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playerconnect/UI/Login/Login.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Started extends StatefulWidget {
  const Started({Key? key}) : super(key: key);

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  int _currentPage = 0;
  Timer? _timer;

  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      // if (_currentPage < 2) {
      //   _currentPage++;
      // } else {
      //   _currentPage = 0;
      // }

      _currentPage < 2 ? _currentPage++ : _currentPage = 0;

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(microseconds: 200),
        curve: Curves.easeIn,
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final pageCount = 3;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: AppFontSize.font40,
                ),
                Image.asset(
                  'assets/images/splash.png',
                  width: AppFontSize.font240,
                ),
                SizedBox(
                  height: AppFontSize.font30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: AppFontSize.font300,
                  child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        _currentPage = index;
                        setState(() {});
                      },
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Player Information',
                              style: TextStyle(
                                  fontSize: AppFontSize.font18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Sed ut perspiciatis unfe omnis iste natus error sit voluptem accusantium doloremque lanudantium',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppFontSize.font14,
                              ),
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Image.asset('assets/images/play1.png')
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Connect With Players Nearby',
                              style: TextStyle(
                                  fontSize: AppFontSize.font18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Sed ut perspiciatis unfe omnis iste natus error sit voluptem accusantium doloremque lanudantium',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppFontSize.font14,
                              ),
                            ),
                            SizedBox(height: AppFontSize.font20),
                            Image.asset('assets/images/play2.png')
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Chat with Players',
                              style: TextStyle(
                                  fontSize: AppFontSize.font18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Sed ut perspiciatis unfe omnis iste natus error sit voluptem accusantium doloremque lanudantium',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppFontSize.font14,
                              ),
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Image.asset('assets/images/play3.png')
                          ],
                        ),
                      ]),
                ),
                SizedBox(
                  height: AppFontSize.font20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: _currentPage == 0
                              ? AppColor.skyBlue
                              : AppColor.white1,
                          borderRadius: BorderRadius.circular(8)),
                      height: 8,
                      width: _currentPage == 0 ? 32 : 8,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: _currentPage == 1
                              ? AppColor.skyBlue
                              : AppColor.white1,
                          borderRadius: BorderRadius.circular(8)),
                      height: 8,
                      width: _currentPage == 1 ? 32 : 8,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: _currentPage == 2
                              ? AppColor.skyBlue
                              : AppColor.white1,
                          borderRadius: BorderRadius.circular(8)),
                      height: 8,
                      width: _currentPage == 2 ? 32 : 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppFontSize.font40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                  child: AppButton.appButton(
                    context,
                    'Get Started',
                    AppColor.blue,
                    AppColor.white,
                    MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
