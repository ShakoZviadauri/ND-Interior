import 'package:flutter/material.dart';
import 'package:n_design/pages/drawer_screen.dart';
import 'package:n_design/pages/main_screen.dart';

import 'package:n_design/screen/living_room_screen.dart'; //Living Room Screen
import 'package:n_design/screen/drawer_details.dart'; //Living Room Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ND Interior Design',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const DrawerScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const DrawerScreen(),
        '/livingroom': (context) => const MainScreen(),
        '/drawerdetail': (context) => const DrawerDetail(),
      },
    );
  }
}
