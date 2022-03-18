import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart';
import 'package:internative/core/service/base_api/base_api.dart';
import 'package:internative/core/service/service_models/user_model.dart/user_model.dart';
 
import 'package:internative/view/authenticate/login/login_view.dart/login_view.dart';
import 'package:internative/view/home_view.dart';

import '../../utility/auth_shared_preferences.dart';
import '../service_models/user_model.dart/auth_error_model.dart';

class AuthAPI extends ChangeNotifier {
  Status loggedInStatus = Status.NotLoggedIn;
  Status registeredInStatus = Status.NotRegistered;

  Future register(String email, String password, passwordRetry,
      BuildContext context) async {
    final Map<String, dynamic> apiBodyData = {
      'Email': email,
      'Password': password,
      'PasswordRetry': passwordRetry
    };

    await post(Uri.parse(BaseAPI.signUp),
        body: json.encode(apiBodyData),
        headers: {'Content-Type': 'application/json'}).then((response) {
      onValue(response, context);
    }).catchError((e) {
      print("Hatalara geldik ${e.toString()}");
    });
  }

  Future signIn(
    String email,
    String password,BuildContext context
  ) async {
    final Map<String, dynamic> apiBodyData = {
      'Email': email,
      'Password': password,
    };

    await post(Uri.parse(BaseAPI.signin),
        body: json.encode(apiBodyData),
        headers: {'Content-Type': 'application/json',
        }).then((response) {
      onEvent(response, context);
    }).catchError((e) {
      // ignore: avoid_print
      print("Hatalara geldik ${e.toString()}");
    });
  }

  notify() {
    notifyListeners();
  }

  static Future<FutureOr> onValue(response, BuildContext context) async {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      User authUser;
      authUser = User.fromJson(responseData);
      var errors = authUser.validationErrors;

      if (authUser.hasError == true && errors.isNotEmpty) {
        for (ValidationErrors user in errors) {
          print("${user.key} = ${user.value}");
        }
      } else if (authUser.hasError == true && errors.isEmpty) {
        print(authUser.message);
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginView()));
        print(authUser.data!.token.toString());
        Fluttertoast.showToast(msg: authUser.data!.token.toString());
      }

      //  Map data = json.decode(authUser.data!.token.toString());

      // now we will create shared preferences and save data

       await UserPreferences().setUserToken(authUser.data!.token.toString());
    } else {
      return Fluttertoast.showToast(msg: "Bağlantı sorunu oluştu!");
    }
  }
   static Future<FutureOr> onEvent(response, BuildContext context) async {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      User authUser;
      authUser = User.fromJson(responseData);
      var errors = authUser.validationErrors;

      if (authUser.hasError == true && errors.isNotEmpty) {
        for (ValidationErrors user in errors) {
          print("${user.key} = ${user.value}");
        }
      } else if (authUser.hasError == true && errors.isEmpty) {
        print(authUser.message);
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage()));
        print((authUser.data!.token.toString()));
        Fluttertoast.showToast(msg: authUser.data!.token.toString());
      }

      //  Map data = json.decode(authUser.data!.token.toString());

      // now we will create shared preferences and save data

      // await UserPreferences().setUserToken(authUser);
    } else {
      return Fluttertoast.showToast(msg: "Bağlantı sorunu oluştu!");
    }
  }
}

enum Status {
  // ignore: constant_identifier_names
  NotLoggedIn,
  // ignore: constant_identifier_names
  NotRegistered,
  // ignore: constant_identifier_names
  LoggedIn,
  // ignore: constant_identifier_names
  Registered,
  // ignore: constant_identifier_names
  Authenticating,
  // ignore: constant_identifier_names
  Registering,
  // ignore: constant_identifier_names
  LoggedOut
  // ignore: constant_identifier_names
}
