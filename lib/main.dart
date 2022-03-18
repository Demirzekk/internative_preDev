import 'package:flutter/material.dart';
import 'package:internative/core/components/widgets/bottom_tabbar.dart';
import 'package:internative/core/service/auth/auth_api.dart';
import 'package:internative/view/authenticate/login/login_view.dart/login_view.dart';
 

import 'package:internative/view/home_view.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();

       SharedPreferences preferences = await SharedPreferences.getInstance();
       bool token = preferences.getString('token') == null ? false : true;
    
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BottomTabbarWidget>(
          create: (context) => BottomTabbarWidget()),
      ChangeNotifierProvider<AuthAPI>(create: (context) => AuthAPI())
    ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Swagger API Demo",
      home: token ? const MyApp() : const LoginView(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {



  final BottomTabbar _bottomTabbar = BottomTabbar();
 
 

  @override
  Widget build(BuildContext context)  {
   
    return Consumer<BottomTabbarWidget>(
      builder: (context, value, child) => Scaffold(
          body:  value.currentScreen ?? const HomePage(),
          bottomNavigationBar: _bottomTabbar
              .tabbar() /*BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: value.selectedItem,
          onTap: (ind) {
            value.selectedItem = ind;
          },
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 254, 254, 255),
          selectedFontSize: 0,
          unselectedFontSize: 0,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.favorite,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person),
            )
          ],
        ),*/
          ),
    );
  }
}
