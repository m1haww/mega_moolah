import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_moolah/pages/about_page.dart';
import 'package:mega_moolah/pages/home_page.dart';
import 'package:mega_moolah/pages/profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: const Color.fromARGB(255, 189, 146, 36),
      tabBar: CupertinoTabBar(
        activeColor: const Color(0xff6B240C),
        backgroundColor: const Color(0xffFAD6BE),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book_circle), label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return const HomePage();
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return const AboutPage();
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return const ProfilePage();
            });
          default:
            return CupertinoTabView(builder: (context) {
              return const HomePage();
            });
        }
      },
    );
  }
}
