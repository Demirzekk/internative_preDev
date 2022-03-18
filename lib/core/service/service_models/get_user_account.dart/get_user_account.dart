import 'package:internative/core/service/service_models/user_model.dart/auth_error_model.dart';

class UserAccountModel {
  List<ValidationErrors>? validationErrors;
  bool? hasError;
  String? message;
  AccountData? data;

  UserAccountModel({this.validationErrors, hasError, this.message, this.data});

  UserAccountModel.fromJson(Map<String, dynamic> json) {
    if (json['ValidationErrors'] != null) {
      validationErrors = <ValidationErrors>[];
      json['ValidationErrors'].forEach((v) {
        validationErrors!.add( ValidationErrors.fromJson(v));
      });
    }
    hasError = json['HasError'];
    message = json['Message'];
    data = AccountData.fromJson(json['Data'])  ;
  }


}

class AccountData {
  String? id;
  String? email;
  String? image;
  Location? location;
  List<String>? favoriteBlogIds;

  AccountData({id, this.email, this.image, this.location, this.favoriteBlogIds});

  AccountData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    email = json['Email'];
    image = json['Image'];
    location = json['Location'] != null
        ?   Location.fromJson(json['Location'])
        : null;
    favoriteBlogIds = (json['FavoriteBlogIds'] ?? []).toList().cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Id'] = id;
    data['Email'] = email;
    data['Image'] = image;
    if (location != null) {
      data['Location'] = location!.toJson();
    }
    data['FavoriteBlogIds'] = favoriteBlogIds;
    return data;
  }

  void add(item) {}
}

class Location {
  String? longtitude;
  String? latitude;

  Location({longtitude, this.latitude});

  Location.fromJson(Map<String, dynamic> json) {
    longtitude = json['Longtitude'];
    latitude = json['Latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Longtitude'] = longtitude;
    data['Latitude'] = latitude;
    return data;
  }
}