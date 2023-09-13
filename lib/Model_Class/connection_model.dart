class ConnectionRequestModel {
  int? success;
  int? code;
  String? message;
  List<ConnectionRequestModelBody>? body;

  ConnectionRequestModel({this.success, this.code, this.message, this.body});

  ConnectionRequestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = <ConnectionRequestModelBody>[];
      json['body'].forEach((v) {
        body!.add(new ConnectionRequestModelBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConnectionRequestModelBody {
  int? id;
  int? senderId;
  int? receiverId;
  var lastMsgId;
  int? status;
  String? createdAt;
  String? updatedAt;
  ConnectionRequestSender? sender;

  ConnectionRequestModelBody(
      {this.id,
        this.senderId,
        this.receiverId,
        this.lastMsgId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.sender});

  ConnectionRequestModelBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    lastMsgId = json['last_msg_id'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sender =
    json['sender'] != null ? new ConnectionRequestSender.fromJson(json['sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['last_msg_id'] = this.lastMsgId;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    return data;
  }
}

class ConnectionRequestSender {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? country;
  String? countryCode;
  String? loginTime;
  var latitude;
  var longitude;
  int? locationRange;
  var otp;
  String? images;
  int? gender;
  String? dob;
  var deviceToken;
  var deviceType;
  String? height;
  String? about;
  String? city;
  String? desiredPartner;
  int? ratingtype;
  String? rating;
  String? playingstyle;
  String? dominnantHand;
  String? countryFlag;
  var socialType;
  var socialId;

  ConnectionRequestSender(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.country,
        this.countryCode,
        this.loginTime,
        this.latitude,
        this.longitude,
        this.locationRange,
        this.otp,
        this.images,
        this.gender,
        this.dob,
        this.deviceToken,
        this.deviceType,
        this.height,
        this.about,
        this.city,
        this.desiredPartner,
        this.ratingtype,
        this.rating,
        this.playingstyle,
        this.dominnantHand,
        this.countryFlag,
        this.socialType,
        this.socialId});

  ConnectionRequestSender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    countryCode = json['country_code'];
    loginTime = json['loginTime'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    locationRange = json['location_range'];
    otp = json['otp'];
    images = json['images'];
    gender = json['gender'];
    dob = json['dob'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    height = json['height'];
    about = json['about'];
    city = json['city'];
    desiredPartner = json['desired_partner'];
    ratingtype = json['ratingtype'];
    rating = json['rating'];
    playingstyle = json['playingstyle'];
    dominnantHand = json['dominnant_hand'];
    countryFlag = json['country_flag'];
    socialType = json['social_type'];
    socialId = json['social_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['loginTime'] = this.loginTime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location_range'] = this.locationRange;
    data['otp'] = this.otp;
    data['images'] = this.images;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['deviceToken'] = this.deviceToken;
    data['deviceType'] = this.deviceType;
    data['height'] = this.height;
    data['about'] = this.about;
    data['city'] = this.city;
    data['desired_partner'] = this.desiredPartner;
    data['ratingtype'] = this.ratingtype;
    data['rating'] = this.rating;
    data['playingstyle'] = this.playingstyle;
    data['dominnant_hand'] = this.dominnantHand;
    data['country_flag'] = this.countryFlag;
    data['social_type'] = this.socialType;
    data['social_id'] = this.socialId;
    return data;
  }
}
