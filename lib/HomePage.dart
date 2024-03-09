// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakaya/Colors.dart';
import 'package:hakaya/HomeScreens/HomeScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    // TODO: Replace with your screen widgets
    return [
      HomeScreen(),
      Container(color: Colors.blue),
      Container(color: Colors.green),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    // TODO: Replace with your navigation bar items
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/Home.svg',
          width: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/svg/Home_no.svg',
          width: 30,
        ),
        //title: 'الرئيسية',
        textStyle: TextStyle(
          fontSize: 14.0, // حجم النص
          color: CupertinoColors.systemGrey, // لون النص
          fontWeight: FontWeight.w400, // سمك الخط
        ),
        activeColorPrimary: AppColors.B400,
        inactiveColorPrimary: Colors.grey,
        iconSize: 30,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/hakaya.svg',
          width: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/svg/hakaya_no.svg',
          width: 30,
        ),
        //title: 'حكايا',
        textStyle: TextStyle(
          fontSize: 14.0, // حجم النص
          color: CupertinoColors.systemGrey, // لون النص
          fontWeight: FontWeight.w400, // سمك الخط
        ),
        activeColorPrimary: AppColors.B400,
        inactiveColorPrimary: Colors.grey,
        iconSize: 30,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.B50, // لون الظل
                offset: Offset(0, 2), // التحريك العمودي
                blurRadius: 1, // شدة الظل
                spreadRadius: 10
              ),
            ],
          ),
          child: Icon(
            Icons.person,
            color: Colors.black,
            shadows: [
              BoxShadow(
                color: AppColors.B300, // لون الظل
                offset: Offset(0, 0), // التحريك العمودي
                blurRadius: 30, // شدة الظل
                spreadRadius: 1
              ),
            ],
          ),
        ),
        activeColorPrimary: AppColors.B50,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: AppColors.B400,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: AppColors.B400,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: AppColors.B50,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: false,
        hideNavigationBarWhenKeyboardShows: false,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: false,

        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
