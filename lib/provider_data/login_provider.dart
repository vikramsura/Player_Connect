import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/shared/BottomNavigationBar.dart';
import 'package:playerconnect/Model_Class/login_model.dart';
import 'package:playerconnect/UI/Sign_Up/Thank_you.dart';
import 'package:playerconnect/shared/SharedPreferences.dart';

class ProviderLogin with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;
  List<LoginBody> allData = [];
bool isLoading=false;
  Future<List> getLogin(context) async {
    isLoading=true;
    notifyListeners();
    Uri myUri = Uri.parse(ApiUtils.loginApi);
    final response = await http.post(myUri, body: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    print("data:::::$data");
    if (response.statusCode == 200) {
      // for (Map<String, dynamic> index in data) {
      // allData.add(LoginBody.fromJson(index));
      // }
      LoginModel loginn = LoginModel.fromJson(data);
      final allDatas = loginn.body!;
      allData.add(allDatas);
      LocalDataSaver.setUserID(allData[0].id.toString());
      LocalDataSaver.setFirst_name(allData[0].firstName.toString());
      LocalDataSaver.setlast_name(allData[0].lastName.toString());
      LocalDataSaver.setEmail(allData[0].email.toString());
      LocalDataSaver.setPhone(allData[0].phone.toString());
      LocalDataSaver.setPlayingstyle(allData[0].playingstyle.toString());
      LocalDataSaver.setDob(allData[0].dob.toString());
      LocalDataSaver.setCountry(allData[0].country.toString());
      LocalDataSaver.setCountry_code(allData[0].countryCode.toString());
      LocalDataSaver.setAbout(allData[0].about.toString());
      LocalDataSaver.setGender(allData[0].gender.toString());
      LocalDataSaver.setRating(allData[0].rating.toString());
      LocalDataSaver.setRatingType(allData[0].ratingtype.toString());
      LocalDataSaver.setHeight(allData[0].height.toString());
      LocalDataSaver.setImages(allData[0].images.toString());
      LocalDataSaver.setTotalexperience(allData[0].totalexperience.toString());
      LocalDataSaver.setUserFcmToken(allData[0].deviceToken.toString());
      LocalDataSaver.setUserAuthToken(allData[0].token.toString());
      LocalDataSaver.setUserLogin(true);
      await getUserDetails();
      AppMassage.buildShowSnackBar(context, 'Login Successfully');
      print("cccccc${allData[0].token}");
      print("aaaaaaa${allData[0].deviceToken}");
      print("aaaaaaaaa${UserDetails.userAuthToken}");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Bottombar(),
          ));
      isLoading=false;
      notifyListeners();
    }
    else {
      print("object");
      AppMassage.buildShowSnackBar(context, 'Something went wrong');
      isLoading=false;
      notifyListeners();
    }
    isLoading=false;
    notifyListeners();
    return [];
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String verificationID = '';

  Future<User?> signInWithGoogle(context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await auth.signInWithCredential(credential);
        final User? currentUser = authResult.user;
        AppMassage.buildShowSnackBar(context, "Google Sign-In successful");
        LocalDataSaver.setFirst_name(currentUser!.displayName.toString());
        LocalDataSaver.setImages(currentUser.photoURL.toString());
        LocalDataSaver.setEmail(currentUser.email.toString());
        LocalDataSaver.setUserID(currentUser.uid.toString());
        LocalDataSaver.setPhone(currentUser.phoneNumber.toString());
        await getUserDetails();

        await FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.uid)
            .set({
          "userId": currentUser.uid,
          "userEmail": currentUser.email,
          "userImage": currentUser.photoURL,
          "userName": currentUser.displayName,
        });
        LocalDataSaver.setUserLogin(true);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Thank_you(),
            ),
            (route) => false);
      }
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }
}
