import 'package:flutter/material.dart';
import 'package:n_design/pages/drawer_screen.dart';
import 'package:n_design/screen/living_room_screen.dart'; // Import other screens if needed
import 'package:n_design/data/data.dart';



// ignore: must_be_immutable
class ProjectScreen extends StatelessWidget {
  ProjectScreen({Key? key}) : super(key: key);

  // List<Map<String, String>> filteredProjects = projectsData.where((project) => project['category'] == '1').toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#fafafa"),
          title: const Text(
            "All Project's",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: "Ubuntu-Regular",
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              onPressed: () {
                // Implement action for the right-side icon
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: projectsData.map((data) {
              return Card(
                elevation: 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/projectsdetail',
                            arguments: {
                              'imagePath': data['imagePath'],
                              'title': data['title'],
                              // Add other data fields here
                            },
                          );
                        },
                        child: Image.asset(
                          data['imagePath']!, // Access imagePath from card data
                          fit: BoxFit.cover,
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['title']!, // Access title from card data
                            style: const TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 16,
                              fontFamily: "Ubuntu-Regular",
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data['subtitle']!, // Access subtitle from card data
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "Ubuntu-Regular",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// Rest of your code...
