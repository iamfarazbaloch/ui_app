import 'package:flutter/material.dart';
import 'package:ui_app/pages/cart_page.dart';
import 'package:ui_app/pages/favourite_page.dart';
import 'package:ui_app/pages/home_page.dart';
import 'package:ui_app/pages/notification_page.dart';

class AppMainPage extends StatefulWidget {
  const AppMainPage({super.key});

  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    FavouritePage(),
    CartPage(),
    NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.brown.shade600,
        unselectedItemColor: Colors.grey.shade300,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
