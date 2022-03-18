 

import 'package:internative/core/service/service_models/user_model.dart/auth_error_model.dart';

import 'auth_data_model.dart';

class User {
  late List<ValidationErrors> validationErrors;
  bool? hasError;
  String? message;
  Data? data;
 
  User.fromJson(Map<String, dynamic> json) {
    
    validationErrors = (json['ValidationErrors']??[])
        .map((value) => ValidationErrors.fromJson(value))
        .toList()
        .cast<ValidationErrors>();
    hasError = json['HasError'];
    message = json['Message'];
    if(json['Data'] ==null){
      return;
    }else{
      data =   Data.fromJson(json['Data'])  ;
    }
    
    
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ValidationErrors'] = validationErrors;
    data['HasError'] = hasError;
    data['Message'] = message;
    if (this.data != null) {
      data['Data'] = data;
    }
    return data;
  }
}

