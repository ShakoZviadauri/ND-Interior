import 'package:flutter/material.dart';


class ProjectsDetail extends StatelessWidget{
  const ProjectsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed from the previous screen
    final Map<String, String?>? arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String?>?;

    if (arguments == null || arguments.isEmpty) {
      // Handle case where arguments are missing or empty
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Invalid data provided'),
        ),
      );
    }

    // Retrieve imagePath and title from arguments
    final String imagePath = arguments['imagePath'] ?? '';
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
            Image.asset(
              imagePath,
              width: 500, // Adjust the size as needed
              height: 300, // Adjust the size as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // You can display additional information here based on your data
          ],
        ),
      ),
    );
  }
}