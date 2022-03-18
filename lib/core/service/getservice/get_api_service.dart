import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:internative/core/service/service_models/get_user_account.dart/get_user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:internative/core/service/base_api/base_api.dart';

import '../service_models/get_category_model.dart/get_category_model.dart';
import '../service_models/user_model.dart/auth_error_model.dart';

class GetApiService extends ChangeNotifier {
  Future<GetCategoriesModel?> getCategory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var response = await http.get(
        Uri.parse(
          BaseAPI.getCategories,
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      var jsonBody = GetCategoriesModel.fromJson(jsonDecode(response.body));

      return jsonBody;
    }
    notifyListeners();
    return null;
  }

  Future<UserAccountModel?> getUserAccountData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var response = await http.get(
        Uri.parse(
          BaseAPI.getCategories,
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      var jsonBody = UserAccountModel.fromJson(jsonDecode(response.body));

      return jsonBody;
    }
    notifyListeners();
    return null;
  }

  Future<GetBlogs?> getBlog(String categoryId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    final Map<String, dynamic> blogBody = {
      'CategoryId': categoryId,
    };

    var blogBodyget = await http.post(
      Uri.parse(
        BaseAPI.getBlogs,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(blogBody),
    );
    if (blogBodyget.statusCode == 200) {
      var jsonBody = GetBlogs.fromJson(jsonDecode(blogBodyget.body));

      return jsonBody;
    }
    notifyListeners();
    return null;
  }

Future<String> returnFunction()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    return token.toString();
}
  Future<FavoriteBlog?> favoriteBlog(String blogId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.getString("token");


    final Map<String, dynamic> blogBody = {
      'id': blogId,
    };

    var favoriteBlogBody = await http.post(
      Uri.parse(
        BaseAPI.favoriteBlog,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $returnFunction"
      },
      body: json.encode(blogBody),
    );
    if (favoriteBlogBody.statusCode == 200) {
      var jsonBody = FavoriteBlog.fromJson(jsonDecode(favoriteBlogBody.body));
      print(jsonBody.message.toString());
      Fluttertoast.showToast(msg: jsonBody.message.toString());
      return jsonBody;
    }
    notifyListeners();
    return null;
  }
}

class FavoriteBlog {
  List<ValidationErrors>? validationErrors;
  bool? hasError;
  String? message;
  bool? data;

  FavoriteBlog({this.validationErrors, this.hasError, this.message, this.data});

  FavoriteBlog.fromJson(Map<String, dynamic> json) {
    if (json['ValidationErrors'] != null) {
      validationErrors = <ValidationErrors>[];
      json['ValidationErrors'].forEach((v) {
        validationErrors!.add(ValidationErrors.fromJson(v));
      });
    }
    hasError = json['HasError'];
    message = json['Message'];
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (validationErrors != null) {
      data['ValidationErrors'] =
          validationErrors!.map((v) => v.toJson()).toList();
    }
    data['HasError'] = hasError;
    data['Message'] = message;
    data['Data'] = data;
    return data;
  }
}

class GetBlogCategory {
  String? categoryId;

  GetBlogCategory({required categoryId});

  GetBlogCategory.fromJson(Map<String, dynamic> json) {
    categoryId = (json['CategoryId'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CategoryId'] = categoryId;
    return data;
  }
}

class GetBlogs {
  List<ValidationErrors>? validationErrors;
  bool? hasError;
  String? message;
  List<BlogData>? data;

  GetBlogs({validationErrors, hasError, message, data});

  GetBlogs.fromJson(Map<String, dynamic> json) {
    if (json['ValidationErrors'] != null) {
      validationErrors = <ValidationErrors>[];
      json['ValidationErrors'].forEach((v) {
        validationErrors!.add(ValidationErrors.fromJson(v));
      });
    }
    hasError = json['HasError'];
    message = json['Message'];
    data = (json['Data'] ?? [])
        .map((value) => BlogData.fromJson(value))
        .toList()
        .cast<BlogData>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (validationErrors != null) {
      data['ValidationErrors'] =
          validationErrors!.map((v) => v.toJson()).toList();
    }
    data['HasError'] = hasError;
    data['Message'] = message;

    return data;
  }
}

class BlogData {
  String? title;
  String? content;
  String? image;
  String? categoryId;
  String? id;

  BlogData({title, content, image, categoryId, id});

  BlogData.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    content = json['Content'];
    image = json['Image'];
    categoryId = json['CategoryId'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Content'] = content;
    data['Image'] = image;
    data['CategoryId'] = categoryId;
    data['Id'] = id;
    return data;
  }
}
