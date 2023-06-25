import 'home_screen.dart';
import 'profile_screen.dart';
import 'shake_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'navbar_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final items =  [
    Lottie.asset("assets/animations/safety2.json",height: 50),
    Lottie.asset("assets/animations/home.json",height: 50),
    Lottie.asset("assets/animations/profile.json",height: 50 ),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.currentIndex;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: const Text("nav_bar"),
      // ),
      body: _buildScreen(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFEADAF5),
        items: items,
        index: currentIndex,
        onTap: (selectedindex) {
          navigationProvider.updateCurrentIndex(selectedindex);
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return ShakeScreen();
      case 2:
        return ProfilePage();
      case 1:
        return HomePage();
      default:
        return HomePage();
    // Add more cases for additional screens
    }
  }
}

