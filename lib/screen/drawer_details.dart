import 'package:flutter/material.dart';


class DrawerDetail extends StatelessWidget{
  const DrawerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      print(arguments);

    if (arguments == null || arguments.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Invalid data provided'),
        ),
      );


    }


    final String title = arguments['title'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Image.network(
            //   imagePath,
            //   width: 300, // Adjust the size as needed
            //   height: 300, // Adjust the size as needed
            //   fit: BoxFit.cover,
            // ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}