 
import '../user_model.dart/auth_error_model.dart';

class GetCategoriesModel {
  late List<ValidationErrors> validationErrors;
  bool? hasError;
  String? message;
  late List<Data> data;

  GetCategoriesModel(
      {validationErrors, hasError, message, data});

  GetCategoriesModel.fromJson(Map<String, dynamic> json) {
  validationErrors = (json['ValidationErrors']??[])
        .map((value) => ValidationErrors.fromJson(value))
        .toList()
        .cast<ValidationErrors>();
    hasError = json['HasError'];
    message = json['Message'];
     data = (json['Data']??[])
        .map((value) => Data.fromJson(value))
        .toList()
        .cast<Data>();
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['ValidationErrors'] =
        validationErrors.map((v) => v.toJson()).toList();
    data['HasError'] = hasError;
    data['Message'] = message;
    
    return data;
  }
}

class Data {
  String? title;
  String? image;
  String? id;

  Data({title, image, id});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    image = json['Image'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Title'] = title;
    data['Image'] = image;
    data['Id'] = id;
    return data;
  }

   
}