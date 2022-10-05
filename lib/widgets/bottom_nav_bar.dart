import 'package:amazon_clone_app/features/account/screens/account_screen.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../constants/global_variables.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/bottom_nav_bar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final double bottomNavigationBarWidth = 42;
  final double bottomBarBorderWidth = 5;
  final List<Widget> _pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart Screen'),
    )
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: _pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => updatePage(value),
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          //* HOMEPAGE
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomNavigationBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth)),
                ),
                child: const Icon(Icons.home_outlined),
              )),

          //* ACCOUNT
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomNavigationBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth)),
                ),
                child: const Icon(Icons.person_outline),
              )),

          //* CART
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomNavigationBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth)),
                ),
                child: Badge(
                    elevation: 0,
                    badgeColor: Colors.white,
                    badgeContent: Text(2.toString()),
                    child: const Icon(Icons.shopping_cart_outlined)),
              )),
        ],
      ),
    );
  }
}
