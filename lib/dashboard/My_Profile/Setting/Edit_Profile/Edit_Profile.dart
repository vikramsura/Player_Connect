import 'package:flutter/material.dart';
import 'package:playerconnect/dashboard/My_Profile/Setting/Edit_Profile/Edit_Profile_2.dart';
import 'package:playerconnect/shared/Button.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppFontSize.font20),
          )),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: AppFontSize.font14,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font10,
                    ),
                    Row(
                      children: [
                        Text(
                          'johnishner@anydoomain',
                          style: TextStyle(
                            fontSize: AppFontSize.font14,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: AppFontSize.font10,
                        ),
                        Image(
                            height: AppFontSize.font16,
                            image: AssetImage(
                                'assets/iconImage/successGreenIconImg.png')),
                      ],
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppFontSize.font90,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppFontSize.font20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/connectWithImg.png'))),
                          height: AppFontSize.font100,
                        ),
                        SizedBox(
                          width: AppFontSize.font20,
                        ),
                        Text(
                          'Change Profile Photo',
                          style: TextStyle(
                              fontSize: AppFontSize.font16,
                              color: AppColor.blue,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: AppFontSize.font14,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font10,
                    ),
                    Container(
                      height: AppFontSize.font50,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            counterText: "",
                            hintText: 'John',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20))),
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Text(
                      'Last Name',
                      style: TextStyle(
                        fontSize: AppFontSize.font14,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font10,
                    ),
                    Container(
                      height: AppFontSize.font50,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            counterText: "",
                            hintText: 'Adams',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20))),
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: AppFontSize.font14,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font10,
                    ),
                    Container(
                      height: AppFontSize.font50,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            counterText: "",
                            hintText: '00000 00000',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppFontSize.font20))),
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Text(
                      'Tennis Experience',
                      style: TextStyle(
                        fontSize: AppFontSize.font14,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
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
                    ),
                    SizedBox(
                      height: AppFontSize.font20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Edit_Two(),
                              ));
                        },
                        child: AppButton.appButton(
                          context,
                          'SAVE',
                          AppColor.blue,
                          AppColor.white,
                          MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ]))),
    );
  }
}
