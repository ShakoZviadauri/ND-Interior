import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
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
                minimumSize: Size.fromHeight(40),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              onPressed: () {},
              child: const Text(
                'Home', 
                style: TextStyle(
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
                minimumSize: Size.fromHeight(40),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              onPressed: () {},
              child: const Text(
                'Gallery', 
                style: TextStyle(
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
                minimumSize: Size.fromHeight(40),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              onPressed: () {},
              child: const Text(
                'Projects', 
                style: TextStyle(
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
                minimumSize: Size.fromHeight(40),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              onPressed: () {},
              child: const Text(
                'About', 
                style: TextStyle(
                  color: Colors.white, 
                  fontFamily: "NotoSansGeorgian",
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
              ),
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