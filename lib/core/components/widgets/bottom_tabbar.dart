import 'package:flutter/material.dart';
import 'package:internative/view/profile_page.dart';
import 'package:provider/provider.dart';

import '../../../view/favorite_page.dart';
import '../../../view/home_view.dart';

class BottomTabbarWidget extends ChangeNotifier {
  final List<Widget> screens = [
    const FavoritePage(),
    const HomePage(),
    const ProfilePage()
  ];

  int _selectedItem = 1;

  set selectedItem(int tab) {
    _selectedItem = tab;
    notifyListeners();
  }

  int get selectedItem => _selectedItem;

  get currentScreen => screens[_selectedItem];
}

class BottomTabbar {
  tabbar() => Consumer<BottomTabbarWidget>(
        builder: (context, value, child) => BottomNavigationBar(
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
        ),
      );
}
