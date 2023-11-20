import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';




final List<Map<String, String>> imgList = [
  {
    'imagePath': 'assets/images/carusel-1.jpg',
    'title': 'Apartment Design in King David, Tbilisi.',
  },
  {
    'imagePath': 'assets/images/carusel-2.jpg',
    'title': 'Apartment Design in Blox, Tbilisi.',
  },
  {
    'imagePath': 'assets/images/carusel-3.jpg',
    'title': 'Apartment Design In Poland Bernandynska.',
  },
  {
    'imagePath': 'assets/images/carusel-4.jpg',
    'title': 'Title 4',
  },
  {
    'imagePath': 'assets/images/carusel-5.jpg',
    'title': 'Title 5',
  },
  {
    'imagePath': 'assets/images/carusel-6.jpg',
    'title': 'Title 6',
  },
];

List<Widget> generateImageSliders(List<Map<String, String>> imgList, BuildContext context) {
  return imgList.map((item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/drawerdetail',
          arguments: {
            'imagePath': item['imagePath'],
            'title': item['title'],
            // Add other data fields here
          },
        );
      },
      child: Container(
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
                  child: Text(
                    item['title']!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Ubuntu-Regular",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              "Featured",
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
              "Dedicated for you who want to keep inspire.",
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
                  items: generateImageSliders(imgList, context),
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
