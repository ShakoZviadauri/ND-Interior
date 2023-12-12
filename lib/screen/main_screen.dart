import 'dart:ffi';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:n_design/data/data.dart';
import 'package:n_design/services/localization_service.dart';
import 'package:provider/provider.dart';
import 'package:octo_image/octo_image.dart';




Future<List<Widget>> generateImageSliders(List<Map<String, dynamic>> projectsData, BuildContext context) async {

  var localizationService = Provider.of<LocalizationService>(context);

  // Locale languageKey = localizationService.getLocale();
  // print(languageKey);

  List<Widget> sliders = projectsData.map((item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/projectsdetail',
          arguments: {
            'id': item['id'],
            'localizationService': localizationService,
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


              CachedNetworkImage(
                imageUrl: item['imagePath']!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.colorBurn),
                    ),
                  ),
                ),
                placeholder: (context, url) => const CircularProgressIndicator(color: Colors.white),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                          Flexible(
                            child: Text(
                              item['title']!,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Ubuntu-Regular",
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                            item['location'] ?? 'Not Found.',
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

  return sliders;
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({Key? key});
  
  List<Map<String, dynamic>> projectsData = [];

  Future<void> fetchData() async {
    List<Map<String, dynamic>> fetchedProjectsData = await ApiHelperMainCarusel.fetchProjectsData(localizationService);

    setState(() {
      projectsData = fetchedProjectsData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }




  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    // List<Map<String, String>> stringProjectsData = convertToMapOfString(projectsData);

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
          FutureBuilder<List<Widget>>(
            future: generateImageSliders(projectsData, context),
            builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return Container(
              //     height: 450,
              //     width: 1000,
              //     child: const Center(
              //       child: CircularProgressIndicator(color: Colors.white,),
              //     ),
              //   );
              // }
              if (snapshot.hasError) {
                return const Text('Error fetching data');
              } else if (snapshot.hasData) {
                return Container(
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
                        items: snapshot.data!, // Use the fetched widget list here
                      );
                    },
                  ),
                );
              } else {
                return Container(); // Return an empty container by default
              }
            },
          ),
        ],
      ),
    );
  }
}


OctoSet blurHash(
  String hash, {
  BoxFit? fit,
  Text? errorMessage,
}) {
  return OctoSet(
    placeholderBuilder: blurHashPlaceholderBuilder(hash, fit: fit),
    errorBuilder: blurHashErrorBuilder(hash, fit: fit),
  );
}

OctoPlaceholderBuilder blurHashPlaceholderBuilder(String hash, {BoxFit? fit}) {
  return (context) => SizedBox.expand(
    child: Image(
      image: BlurHashImage(hash),
      fit: fit ?? BoxFit.cover,
    ),
  );
}


OctoErrorBuilder blurHashErrorBuilder(
  String hash, {
  BoxFit? fit,
  Text? message,
  IconData? icon,
  Color? iconColor,
  double? iconSize,
}) {
  return OctoError.placeholderWithErrorIcon(
    blurHashPlaceholderBuilder(hash, fit: fit),
    message: message,
    icon: icon,
    iconColor: iconColor,
    iconSize: iconSize,
  );
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