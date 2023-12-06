import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:n_design/data/data.dart';
import 'package:n_design/services/localization_service.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
String maximumId = '2';
// const IconData location_on = IconData(0xe3ab, fontFamily: 'MaterialIcons');

 // Get the length of the resulting list


List<Widget> generateImageSliders(List<Map<String, String>> projectsData, BuildContext context) {

  int startingIndex = projectsData.length >= 3 ? projectsData.length - 3 : 0;
  List<Map<String, String>> latestProjects = projectsData.sublist(startingIndex);
  // LocalizationService localizationService = LocalizationService.getInstance();


  return latestProjects.map((item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/projectsdetail',
          arguments: {
            'id': item['id']
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(
                item['imagePath']!,
                fit: BoxFit.cover,
                width: 1000.0,
                height: 500,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Text(
                            item['title']!,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Ubuntu-Regular",
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3), 
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on, 
                            color: Colors.white, 
                            size: 12,
                          ),
                          const SizedBox(width: 5), 
                          Text(
                            item['location']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5), 
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }).toList();
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    List<Map<String, String>> stringProjectsData = convertToMapOfString(projectsData);

    var localizationService = Provider.of<LocalizationService>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              localizationService.translate('featured') ?? '',
              style: TextStyle(
                color: HexColor("#1b2b41"),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontFamily: "Ubuntu-Regular",
                // letterSpacing: 2.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            child: Text(
              localizationService.translate('keep_inspire') ?? '',
              style: TextStyle(
                color: HexColor("#8d919e"),
                letterSpacing: 0.8,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final screenHeight = MediaQuery.of(context).size.height;
                return CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    height: screenHeight * 0.6,
                    viewportFraction: 0.9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                  items: generateImageSliders(stringProjectsData, context),
                );
              },
            ),
          ),
        ],
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


List<Map<String, String>> convertToMapOfString(List<Map<String, dynamic>> data) {
  return data.map((item) {
    Map<String, String> convertedItem = {};
    item.forEach((key, value) {
      convertedItem[key] = value.toString(); // Convert all values to String
    });
    return convertedItem;
  }).toList();
}