class SearchPlayerModel {
  int? success;
  int? code;
  String? message;
  List<SearchPlayerModelBody>? body;

  SearchPlayerModel({this.success, this.code, this.message, this.body});

  SearchPlayerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = <SearchPlayerModelBody>[];
      json['body'].forEach((v) {
        body!.add(new SearchPlayerModelBody.fromJson(v));
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

class SearchPlayerModelBody {
  int? id;
  String? firstName;
  String? lastName;
  String? city;
  String? latitude;
  String? longitude;
  int? locationRange;
  String? rating;
  int? ratingtype;
  double? distance;

  SearchPlayerModelBody(
      {this.id,
        this.firstName,
        this.lastName,
        this.city,
        this.latitude,
        this.longitude,
        this.locationRange,
        this.rating,
        this.ratingtype,
        this.distance});

  SearchPlayerModelBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    locationRange = json['location_range'];
    rating = json['rating'];
    ratingtype = json['ratingtype'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location_range'] = this.locationRange;
    data['rating'] = this.rating;
    data['ratingtype'] = this.ratingtype;
    data['distance'] = this.distance;
    return data;
  }
}
