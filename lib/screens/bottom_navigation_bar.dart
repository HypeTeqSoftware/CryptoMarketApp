import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/screens/home_tab/home_screen.dart';
import 'package:crypto_app/screens/market_tab/coins_page.dart';
import 'package:crypto_app/screens/profile_screen.dart';
import 'package:crypto_app/screens/treds_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomNavItems =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart_outlined),
      label: 'Market',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.ssid_chart_outlined),
      label: 'Trade',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'Profile',
    ),
  ];

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CoinsPage(),
    const TradeScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.primary,
        ),
        child: BottomNavigationBar(
          items: bottomNavItems,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: AppColors.primary,
          unselectedItemColor: AppColors.white54,
          iconSize: 30,
          selectedLabelStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
