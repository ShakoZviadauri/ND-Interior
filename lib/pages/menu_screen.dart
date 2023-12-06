// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:n_design/services/localization_service.dart';
import 'package:provider/provider.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}


class _MenuScreenState extends State<MenuScreen> {

  final LocalizationService localizationService = LocalizationService.getInstance();
  

  void _changeLanguage(Locale locale, BuildContext context) {
    var localizationService = Provider.of<LocalizationService>(context, listen: false);
    localizationService.changeLanguage(locale);
  }


  @override
  Widget build(BuildContext context) {

    var localizationService = Provider.of<LocalizationService>(context);

    return Scaffold(
      backgroundColor: HexColor("#525FE1"), //HexColor("#F6F4EB")
      body: Column(        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
          //   child: Image.asset(
          //     'assets/images/logo_v1.jpg',
          //     height: 110,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20),
            child : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              onPressed: () {},
              child: Text(
                localizationService.translate('home') ?? '',
                style: const TextStyle(
                  color: Colors.white, 
                  fontFamily: "NotoSansGeorgian",
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0, left: 20),
            child : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              onPressed: () {},
              child: Text(
                localizationService.translate('gallery') ?? '', 
                style: const TextStyle(
                  color: Colors.white, 
                  fontFamily: "NotoSansGeorgian",
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0, left: 20),
            child : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              onPressed: () {},
              child: Text(
                localizationService.translate('projects') ?? '', 
                style: const TextStyle(
                  color: Colors.white, 
                  fontFamily: "NotoSansGeorgian",
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0, left: 20),
            child : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              onPressed: () {},
              child: Text(
                localizationService.translate('about') ?? '', 
                style: const TextStyle(
                  color: Colors.white, 
                  fontFamily: "NotoSansGeorgian",
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
              ),
            ),
          ),


            const SizedBox(height: 20),

            // Language List
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _changeLanguage(const Locale('en'), context);
                    },
                    style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7), 
                      ),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(10),
                      backgroundColor: localizationService.getLocale().languageCode == 'en' ? Colors.black : Colors.white,
                    ),
                    child: Text('EN', 
                      style: TextStyle(
                        color: localizationService.getLocale().languageCode == 'en' ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  // SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      _changeLanguage(const Locale('ka'), context);
                    },
                    style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7), 
                      ),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(10),
                      backgroundColor: localizationService.getLocale().languageCode == 'ka' ? Colors.black : Colors.white,
                    ),
                    child: Text('KA', 
                      style: TextStyle(
                        color: localizationService.getLocale().languageCode == 'ka' ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  // Georgian language button
                  ElevatedButton(
                    onPressed: () {
                      _changeLanguage(const Locale('ru'), context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7), 
                      ),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(10),
                      backgroundColor: localizationService.getLocale().languageCode == 'ru' ? Colors.black : Colors.white,
                    ),
                    child: Text('RU', 
                      style: TextStyle(
                        color: localizationService.getLocale().languageCode == 'ru' ? Colors.white : Colors.black,
                      ),
                    ),
                  ),

                ],
              ),
            ),



        ],
      ),
      // body: Container(
      //   margin: EdgeInsets.fromLTRB(80, 50, 0, 0), //left, top, right, bottom
      //   child: Text(
      //     'ND \nInterior',
      //     style: TextStyle(
      //         fontSize: 30,
      //         fontWeight: FontWeight.w700,
      //         color: HexColor("#4682A9"),
      //       ),
      //     ),
      // ),
        
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