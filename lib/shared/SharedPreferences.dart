import 'package:shared_preferences/shared_preferences.dart';

class UserDetails {
  static String? userID;
  static String? first_name;
  static String? last_name;
  static String? email;
  static String? phone;
  static String? dob;
  static String? country;
  static String? country_code;
  static String? gender;
  static String? totalexperience;
  static String? height;
  static String? rating;
  static String? ratingType;
  static String? about;
  static String? playingstyle;
  static String? images;
  static String? userFcmToken;
  static String? userAuthToken;
}

class LocalDataSaver {
  static const userIDKey = "User ID Key";
  static const first_nameKey = "first_name Key";
  static const last_nameKey = "last_name Key";
  static const emailKey = "email Key";
  static const phoneKey = "phone Key";
  static const dobKey = "dob Key";
  static const countryKey = "Image Key";
  static const country_codeKey = "country_code Key";
  static const genderKey = "gender Key";
  static const totalexperienceKey = "totalexperience Key";
  static const heightKey = "height Key";
  static const ratingKey = "rating Key";
  static const ratingTypeKey = "rating Type Key";
  static const aboutKey = "about Key";
  static const playingstyleKey = "playingstyle Key";
  static const imagesKey = "images Key";
  static const userFcmTokenKey = "userFcmToken Key";
  static const userAuthTokenKey = "userAuthToken Key";
  static const userLoginKey = "userLogin Key";

  static Future<bool> setUserID(String userID) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userIDKey, userID);
  }

  static Future<String?> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userIDKey);
  }
  static Future<bool> setFirst_name(String first_name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(first_nameKey, first_name);
  }

  static Future<String?> getFirst_name() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(first_nameKey);
  }

  static Future<bool> setlast_name(String last_name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(last_nameKey, last_name);
  }

  static Future<String?> getLast_name() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(last_nameKey);
  }

  static Future<bool> setEmail(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(emailKey, email);
  }

  static Future<String?> getEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(emailKey);
  }

  static Future<bool> setCountry(String country) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(countryKey, country);
  }

  static Future<String?> getCountry() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(countryKey);
  }

  static Future<bool> setPhone(String phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(phoneKey, phone);
  }

  static Future<String?> getPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(phoneKey);
  }

  static Future<bool> setDob(String userImage) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(dobKey, userImage);
  }

  static Future<String?> getDob() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(dobKey);
  }

  static Future<bool> setCountry_code(String country_code) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(country_codeKey, country_code);
  }

  static Future<String?> getCountry_code() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(country_codeKey);
  }

  static Future<bool> setGender(String gender) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(genderKey, gender);
  }

  static Future<String?> getgender() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(genderKey);
  }

  static Future<bool> setUserFcmToken(String userFcmToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userFcmTokenKey, userFcmToken);
  }

  static Future<String?> getUserFcmToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userFcmTokenKey);
  }

  static Future<bool> setTotalexperience(String totalexperience) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(totalexperienceKey, totalexperience);
  }

  static Future<String?> getTotalexperience() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(totalexperienceKey);
  }

  static Future<bool> setHeight(String height) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(heightKey, height);
  }

  static Future<String?> getHeight() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(heightKey);
  }

  static Future<bool> setRating(String rating) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(ratingKey, rating);
  }

  static Future<String?> getRating() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(ratingKey);
  }

  static Future<bool> setRatingType(String ratingType) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(ratingTypeKey, ratingType);
  }

  static Future<String?> getRatingType() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(ratingTypeKey);
  }

  static Future<bool> setAbout(String about) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(aboutKey, about);
  }

  static Future<String?> getAbout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(aboutKey);
  }

  static Future<bool> setPlayingstyle(String playingstyle) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(playingstyleKey, playingstyle);
  }

  static Future<String?> getPlayingstyle() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(playingstyleKey);
  }

  static Future<bool> setImages(String images) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(imagesKey, images);
  }

  static Future<String?> getImages() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(imagesKey);
  }

  static Future<bool> setUserAuthToken(String userAuthToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userAuthTokenKey, userAuthToken);
  }

  static Future<String?> getUserAuthToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userAuthTokenKey);
  }

  static Future<bool> setUserLogin(bool isLogin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool(userLoginKey, isLogin);
  }

  static Future<bool?> getUserLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(userLoginKey);
  }
}

Future getUserDetails() async {
  UserDetails.userID = await LocalDataSaver.getUserID();
  UserDetails.first_name = await LocalDataSaver.getFirst_name();
  UserDetails.last_name = await LocalDataSaver.getLast_name();
  UserDetails.email = await LocalDataSaver.getEmail();
  UserDetails.phone = await LocalDataSaver.getPhone();
  UserDetails.dob = await LocalDataSaver.getDob();
  UserDetails.country = await LocalDataSaver.getCountry();
  UserDetails.country_code = await LocalDataSaver.getCountry_code();
  UserDetails.totalexperience = await LocalDataSaver.getTotalexperience();
  UserDetails.about = await LocalDataSaver.getAbout();
  UserDetails.rating = await LocalDataSaver.getRating();
  UserDetails.gender = await LocalDataSaver.getgender();
  UserDetails.height = await LocalDataSaver.getHeight();
  UserDetails.playingstyle = await LocalDataSaver.getPlayingstyle();
  UserDetails.images = await LocalDataSaver.getImages();
  UserDetails.ratingType = await LocalDataSaver.getRatingType();
  UserDetails.userAuthToken = await LocalDataSaver.getUserAuthToken();
  UserDetails.userFcmToken = await LocalDataSaver.getUserFcmToken();
}

Future clearUserDetails() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
  await sharedPreferences.remove("User ID Key");
  LocalDataSaver.setUserLogin(false);
  await getUserDetails();
  print("UserDetails.userId::${UserDetails.userAuthToken}");
}
