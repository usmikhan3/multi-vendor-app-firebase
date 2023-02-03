import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_vendor/views/buyers/nav_screens/account_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/cart_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/category_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/home_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/search_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/store_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  void onTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  List<Widget> _pages = [
    HomeScreen(),
    CategoriesScreen(),
    StoreScreen(),
    CartScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: onTapped,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.yellow.shade900,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'HOME'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/explore.svg",
                width: 25,
              ),
              label: 'CATEGORY'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/shop.svg",
                width: 20,
              ),
              label: 'STORE'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                width: 20,
              ),
              label: 'CART'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                width: 20,
              ),
              label: 'SEARCH'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/account.svg",
                width: 20,
              ),
              label: 'ACCOUNT'),
        ],
      ),
    );
  }
}
