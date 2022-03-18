 
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

 

class UserPreferences extends ChangeNotifier{

   
 

 

  void removeUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
 
  
   
    prefs.remove('token');

  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token =  prefs.getString("token");
    notifyListeners(); 
    return token;
  }
   setUserToken(String user) async  {
      SharedPreferences prefs =  await  SharedPreferences.getInstance();
    
     await prefs.setString("token",user);
    
    notifyListeners();
     
   
  }
}