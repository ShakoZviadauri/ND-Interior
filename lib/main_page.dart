import 'package:flutter/material.dart';


class MainPage extends StatelessWidget{

  const MainPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image

          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/interior-1.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          ListView(
            children: <Widget>[
              // Empty space for better readability
              // SizedBox(height: 200),
              // Logo
              Center(
                child: FlutterLogo(
                  size: 100, // Adjust the size of the logo as needed
                ),
              ),
              // Title
              Center(
                child: Text(
                  'My App Title',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Centered Text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'This is a simple Flutter app with a full-page scrolling background image, logo, title, and centered text.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Additional Content Here
              // ...
            ],
          ),
        ],
      ),
    );
  }

}