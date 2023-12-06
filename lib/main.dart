// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:n_design/pages/drawer_screen.dart';
import 'package:n_design/pages/main_screen.dart';

// import 'package:n_design/screen/living_room_screen.dart'; //Living Room Screen
import 'package:n_design/screen/drawer_details.dart'; //Drawer Details
import 'package:n_design/single/projects_detail.dart'; //Living Room Screen
import 'package:n_design/services/localization_service.dart';
import 'package:provider/provider.dart';
// import 'package:n_design/data/data.dart'; //Living Room Screen


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocalizationService.getInstance(),
      child: MyApp(),
    ),
  );
}





class MyApp extends StatelessWidget {
  final LocalizationService localizationService = LocalizationService.getInstance();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: localizationService.init(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            supportedLocales: const [
              Locale('en'), // English
              Locale('ru'), // Russian
              Locale('ka'), // Georgian
              // Add more locales as needed
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              ...GlobalCupertinoLocalizations.delegates,
            ],
            locale: localizationService.getLocale(),
            debugShowCheckedModeBanner: false,
            title: 'ND Interior Design',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // home: const DrawerScreen(),
            initialRoute: '/',
            routes: {
              '/': (context) => const DrawerScreen(),
              '/livingroom': (context) => const MainScreen(),
              '/drawerdetail': (context) => const DrawerDetail(),
              '/projectsdetail': (context) => const ProjectsDetailPage(),
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}



// void fetchDataFromAPI() async {
//   List<Map<String, dynamic>> fetchedData = await fetchProjectsData();
//   if (fetchedData.isNotEmpty) {
//     // Use fetchedData in your app logic
//     // print('Fetched Data: $fetchedData');
//     fetchedData.forEach((project) {
//       print('Title: ${project}');
//     });


//   } else {
//     // Handle cases where no data is fetched or an error occurs
//     print('No data fetched or an error occurred');
//   }
// }

// fetchProjectsData() {

// }