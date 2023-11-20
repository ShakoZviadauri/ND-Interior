import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:n_design/screen/main_screen.dart'; // Main Screen
import 'package:n_design/screen/projects_screen.dart'; // Projects Screen
import 'package:n_design/screen/bathroom_screen.dart'; //Bathroom Screen
import 'package:n_design/screen/bedroom_screen.dart'; // Bedroom Screen
import 'package:n_design/screen/living_room_screen.dart'; //Living Room Screen



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}




  final iconList = <IconData>[
    FontAwesomeIcons.houseTsunami,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.toilet,
    FontAwesomeIcons.couch,
  ];

// Text(
//   'No. ${imgList.indexOf(item)} image',
//   style: const TextStyle(
//     color: Colors.white,
//     fontSize: 20.0,
//     fontWeight: FontWeight.bold,
//   ),
// ),

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {

  var _bottomNavIndex = 5; //default index of a first screen
  bool _showAppBar = false; // Variable to control the visibility of the AppBar
  Widget? _currentScreen;
  // String _customAppBarTitle = '';

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  @override
  void initState() {
    super.initState();

    _currentScreen = HomeScreen();

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }


  // Main Home Screen





 AppBar _buildMainAppBar() {
    return AppBar(
      backgroundColor: HexColor("#fafafa"),
      toolbarHeight: 80,
      elevation: 0,
      leadingWidth: 90,
      leading: IconButton(
        onPressed: (){
          if (ZoomDrawer.of(context)!.isOpen()) {
            ZoomDrawer.of(context)!.close();
          } else {
            ZoomDrawer.of(context)!.open();
          }
        },
        icon: Icon(
          FontAwesomeIcons.barsStaggered, 
          color: HexColor("#101010"),
          size: 26.0,
        ),
      ),
    );
  }


  AppBar _buildCustomAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ), // Custom back icon
        onPressed: () {
          setState(() {
            _currentScreen = HomeScreen(); // Navigate back to the first screen
            _showAppBar = false;
          });
        },
      ),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _showAppBar ? null : _buildMainAppBar(),
      // appBar: 
      body: Scaffold(
        body: _currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        backgroundColor: HexColor("39A7FF"),
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {
          setState(() {
            _currentScreen = HomeScreen(); // Call the function to navigate to the main page
            _showAppBar = false;
            _bottomNavIndex = 6;
          });
          _fabAnimationController.reset();
          _borderRadiusAnimationController.reset();
          _borderRadiusAnimationController.forward();
          _fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? HexColor("39A7FF") : HexColor("87C4FF");
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 20,
                color: color,
              ),
              const SizedBox(height: 4),
              
            ],
          );
        },
        backgroundColor: HexColor("FFF6F4"),
        activeIndex: _bottomNavIndex,
        splashColor: HexColor("1b2b41"),
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 200,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            switch (index) {
              case 0:
                _currentScreen = ProjectScreen();
                _showAppBar = true;
                // _customAppBarTitle = 'Project';
                break;
              case 1:
                _currentScreen = const BedroomScreen();
                 _showAppBar = true;
                //  _customAppBarTitle = 'Bedroom';
                break;
              case 2:
                _currentScreen = const BathroomScreen();
                 _showAppBar = true;
                //  _customAppBarTitle = 'Bathroom';
                break;
              case 3:
                _currentScreen = const LivingRoomScreen();
                 _showAppBar = true;
                //  _customAppBarTitle = 'Living Room';
                break;
            }
          });
        },
        hideAnimationController: _hideBottomBarAnimationController,
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Color.fromARGB(255, 204, 204, 204),
        ),
      ),
      
    );
  }
}



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
