import 'dart:convert';
import 'dart:io';

import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:playerconnect/All_Data.dart';
import 'package:playerconnect/Login/Login.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';

class ProviderSignUp with ChangeNotifier {
  File? file;
  int? gender;
  bool isShowPassword = true;
  double utrRating = 0;
  double ntrpRating = 0;
  double DrivingDistance = 0.0;
  bool isUtr = true;
  bool isdominant = true;
  String? countryFlag;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchesController = TextEditingController();
  TextEditingController playingController = TextEditingController();
  TextEditingController desiredController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String countryNameController = "India";
  String codeController = "+91";

  Future setSignUpData(context) async {
    try {
      Uri myUri = Uri.parse(ApiUtils.singUpApi);
      final dataFrom = await http.MultipartRequest('POST', myUri);
      dataFrom.fields.addAll({
        "first_name": firstController.text,
        "last_name": lastController.text.trim(),
        "email": emailController.text.trim(),
        "phone": phoneController.text.trim(),
        "dob": dateController.text.trim(),
        "country": countryNameController.toString(),
        "country_code": codeController.toString(),
        "password": phoneController.text.trim(),
        "role": 1.toString(),
        "gender": gender.toString(),
        "totalexperience": textController.text.trim(),
        "height": feetController.text.trim(),
        "rating": isUtr ? utrRating.toString() : ntrpRating.toString(),
        "city": cityController.text.trim(),
        "about": textController.text.trim(),
        "desired_partner": desiredController.text.trim(),
        "dominnant_hand": isdominant.toString(),
        "location_range": DrivingDistance.toString(),
        "ratingtype": isUtr ? 0.toString() : 1.toString(),
        "country_flag": DrivingDistance.toString(),
        "playingstyle": playingController.text.trim(),
        "images": file!.path,
      });
      final response = await http.Response.fromStream(await dataFrom.send());
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
            (route) => false);
        AppMassage.buildShowSnackBar(context, "SignUp Successfully");
      } else if (data["message"].toString() ==
          "Please used another number this number is already exits") {
        AppMassage.buildShowSnackBar(
            context, "Please used another number this number is already exits");
      } else if (data["message"].toString() == "Email Already exits") {
        AppMassage.buildShowSnackBar(
            context, "Please used another Email this email is already exits");
      } else {
        AppMassage.buildShowSnackBar(context, "Something went wrong");
        print("SignUprResponse.body:::${response.body}");
      }
    } catch (e) {
      print("SignUpErrore.body:::${e}");
    }
  }

  void handleAttachmentPressed(context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: AppFontSize.font100,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    color: AppColor.skyBlue,
                    iconSize: AppFontSize.font50,
                    onPressed: () {
                      getImage(context, ImageSource.gallery);
                    },
                    icon: Icon(Icons.browse_gallery)),
                IconButton(
                    color: AppColor.skyBlue,
                    iconSize: AppFontSize.font50,
                    onPressed: () {
                      getImage(context, ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_enhance_rounded)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getImage(context, source) async {
    final picker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await picker.pickImage(source: source);
    file = File(pickedFile!.path);
    notifyListeners();
    Navigator.of(context).pop();
  }

  DateTime selectedDate = DateTime.now();

  Future selectDateTime(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
        // lastDate: DateTime(2025),
        helpText: "Select Date",
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                  primary: AppColor.skyBlue, secondary: Colors.black),
            ),
            child: child ?? Text(""),
          );
        });
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      var dateTime = DateTime.parse(selectedDate.toString());

      var formatDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
      dateController = TextEditingController(text: formatDate);
      notifyListeners();
    }
  }

  void showCountryPicker(context) async {
    final country = await showCountryPickerSheet(context);
    if (country != null) {
      countryNameController = country.name.toString();
      codeController = country.callingCode.toString();
      countryFlag = country.flag.toString();
      notifyListeners();
    }
    notifyListeners();
  }

  void initCountry(context) async {
    final country = await getCountryByCountryCode(context, "IN");
    countryFlag = country?.flag.toString();
    countryNameController = country!.name.toString();
    codeController = country.callingCode.toString();
    notifyListeners();
  }

  void getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("longitude:${currentPosition.longitude}");
      print("latitude:${currentPosition.latitude}");
      getAddressFromLatLng(currentPosition);
    }
  }

  Future<void> getAddressFromLatLng(currentPosition) async {
    await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      print("place${place}");
      String currentAddress =
          ' ${place.subLocality}, ${place.subAdministrativeArea},${place.locality}, ${place.postalCode}';
      cityController.text = currentAddress.toString();
      notifyListeners();
    }).catchError((e) {});
  }
}
