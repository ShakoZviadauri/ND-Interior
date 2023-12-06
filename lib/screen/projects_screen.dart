import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:n_design/pages/drawer_screen.dart';
import 'package:n_design/screen/living_room_screen.dart'; // Import other screens if needed
import 'package:n_design/data/data.dart';
import 'package:n_design/services/localization_service.dart';
import 'package:provider/provider.dart';


class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);
  
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

// ignore: must_be_immutable
class _ProjectScreenState extends State<ProjectScreen> {
 
  late Future<List<Map<String, dynamic>>> projectsFuture;
  List<Map<String, dynamic>> projectsData = [];
  // LocalizationService localizationService = LocalizationService.getInstance();
  

  final ScrollController _scrollController = ScrollController();
  bool _isTop = false;

  // List<Map<String, dynamic>> filteredProjects = projectsData.where((project) => project['category'] == '1').toList();
  // projectsData.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  // projectsData.sort((Tab, Tab), {super.key} => a['id'].compareTo(b['id']));
  

  @override
  void initState() {
    super.initState();
    fetchData();
    projectsFuture = fetchData();
    _scrollController.addListener(_scrollListener);

  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    List<Map<String, dynamic>> fetchedProjectsData = await ApiHelper.fetchProjectsData(localizationService);

    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      projectsData = fetchedProjectsData;
    });
    return Future.value(fetchedProjectsData); // Return the fetched data as Future<List<Map<String, dynamic>>>
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  void _scrollListener() {
    if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isTop = true;
      });
    } else {
      setState(() {
        _isTop = false;
      });
    }
  }





  // Future<void> fetchData() async {
  //   List<Map<String, dynamic>> fetchedProjectsData = await ApiHelper.fetchProjectsData();
  //   setState(() {
  //     projectsData = fetchedProjectsData;
  //   });
  // }
  Future<void> _refresh() async {
    try {
      List<Map<String, dynamic>> refreshedProjectsData = await ApiHelper.fetchProjectsData(localizationService);
      setState(() {
        projectsData = refreshedProjectsData;
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error scenarios
    }
  }

  @override
  Widget build(BuildContext context) {

    var localizationService = Provider.of<LocalizationService>(context);

    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#fafafa"),
          title: Text(
            localizationService.translate('all_projects') ?? '', 
            textAlign: TextAlign.center,
            style: const TextStyle(
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
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: projectsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: snapshot.data!.map((data) {
                    

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
                              'id': data['id']
                            },
                          );
                        },
                        child: Image.network(
                          data['imagePath'], 
                          fit: BoxFit.cover,
                          height: 200,
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
              );
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }


}

//   @override
//   Widget build(BuildContext context) {
    
//     // projectsData.sort((a, b) => a['id'].compareTo(b['id'])); //order by ASC
//     projectsData.sort((a, b) => b['id'].compareTo(a['id'])); // order by DESC

//     return 
//   }
// }

// Rest of your code...
