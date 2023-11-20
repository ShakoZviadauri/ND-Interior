import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

// import 'package:n_design/data/data.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:n_design/quiz_class.dart';
import 'package:n_design/main_page.dart';



class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainPage()),
    );
  }
  
  // final Color color = HexColor('#aabbcc');

  // Widget _buildImage(String assetName, [double width = 350]) {
  //   return Image.asset('assets/images/$assetName', width: width);
  // }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // titlePadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      // allowImplicitScrolling: true,
      // autoScrollDuration: 5000,
      // infiniteAutoScroll: false,
      pagesAxis: Axis.horizontal,
      // globalHeader: Align(
      //   alignment: Alignment.topCenter,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child: Image.asset('assets/images/logo-2.jpg'),
      //     ),
      //   ),
      // ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () => _onIntroEnd(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: HexColor("#5182ab"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: const Text('Let\'s go right away!'),
        ),
      ),
      pages: [

        PageViewModel(
          title: "How else will you know how to design your home?",
          body: "One of my strongest convictions, and one of the first canons of good taste, is that our houses, like the fish's shell and the bird's nest, ought to represent our individual taste and habits.",
          image: Center(
            child: Image.asset(
              "assets/images/vector-1-1.jpg", 
              fit: BoxFit.fill,
            ),
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 12,
            safeArea: 80,
            pageColor: const Color.fromRGBO(255, 255, 255, 1),
            imagePadding: const EdgeInsets.only(top: 0),
            bodyTextStyle: const TextStyle(
              fontFamily: 'Montserrat-VariableFont',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.5,
            ),
            titleTextStyle: const TextStyle(
              fontFamily: 'Montserrat-VariableFont',
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
              fontSize: 22,
            ),
          ),
        ),

        PageViewModel(
          title: "In the past, interiors were put together instinctively as a part of the process of building.",
          body: "The profession of interior design has been a consequence of the development of society and the complex architecture that has resulted from the development of industrial processes.",
          image: Center(
            child: Image.asset(
              "assets/images/vector-3.jpg", 
              fit: BoxFit.fill,
            ),
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 9,
            safeArea: 80,
            pageColor: const Color.fromRGBO(255, 255, 255, 1),
            imagePadding: const EdgeInsets.only(top: 0),
            bodyTextStyle: const TextStyle(
              fontFamily: 'Montserrat-VariableFont',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.5,
            ),
            titleTextStyle: const TextStyle(
              fontFamily: 'Montserrat-VariableFont',
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
              fontSize: 22,
            ),
          ),
        ),


        PageViewModel(
          title: "In the mid-to-late 19th century, interior design services expanded greatly",
          body: "The pursuit of effective use of space, user well-being and functional design has contributed to the development of the contemporary interior design profession",
          image: Center(
            child: Image.asset(
              "assets/images/vector-1-2.jpg", 
              fit: BoxFit.fill,
            ),
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 10,
            safeArea: 80,
            pageColor: const Color.fromRGBO(255, 255, 255, 1),
            imagePadding: const EdgeInsets.only(top: 0),
            bodyTextStyle: const TextStyle(
              fontFamily: 'Montserrat-VariableFont',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.5,
            ),
            titleTextStyle: const TextStyle(
              fontFamily: 'Montserrat-VariableFont',
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
              fontSize: 23,
            ),
          ),
        ),




      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0), 
        activeColor: Color.fromRGBO(94, 152, 199, 1),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        // color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

          // bodyWidget: Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: AssetImage('assets/images/interior-1.jpg'))
          //   ),
          // ),


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