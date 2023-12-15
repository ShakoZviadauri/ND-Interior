import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';

import 'dart:ffi' as ffi;
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
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



class _ProjectScreenState extends State<ProjectScreen> {
  late Future<List<Map<String, dynamic>>> projectsFuture;
  List<Map<String, dynamic>> projectsData = [];
  final ScrollController _scrollController = ScrollController();
  // bool _isTop = false;
  bool _isLoading = false;
  int currentPage = 1;

  String? filter_text = localizationService.translate('button_apply');

  // List of filter options
  List<String> filters = [
    localizationService.translate('sort_popularity') ?? 'no filter popularity',
    localizationService.translate('sort_likes') ?? 'no filter likes', 
    localizationService.translate('sort_verify') ?? 'no filter verify',
    localizationService.translate('sort_date') ?? 'no filter date',
  ];
  List<bool> selectedFilters = List.generate(4, (index) => false);


  @override
  void initState() {
    super.initState();
    projectsFuture = fetchData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange && !_isLoading) {
      _fetchMoreData();
    }
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    // Fetch initial data (page 1)
    List<Map<String, dynamic>> fetchedProjectsData = await ApiHelper.fetchProjectsData(localizationService, 1);
    setState(() {
      projectsData = fetchedProjectsData;
    });
    return Future.value(fetchedProjectsData);
  }

  Future<void> _fetchMoreData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Map<String, dynamic>> newData = await ApiHelper.fetchProjectsData(localizationService, currentPage + 1);
      if (newData.isNotEmpty) {
        setState(() {
          projectsData.addAll(newData);
          _isLoading = false;
          currentPage++;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching more data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Icons.filter_alt,
              color: Colors.black,
            ),
            onPressed: () {
              // Implement action for the right-side icon
              _showModalPopup(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: projectsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return _buildListView();
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    ),
    );
  }

  Widget _buildListView() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: projectsData.length,
            itemBuilder: (context, index) {
              return YourCardWidget(context, data: projectsData[index]);
            },
          ),
        ),
        _buildLoadingIndicator(),
      ],
    );
    
  }


  Widget _buildLoadingIndicator() {
    return _isLoading
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          )
        : const SizedBox.shrink();
  }



  // filter product list options
  void _showModalPopup(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    localizationService.translate('filters_option') ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  for (int i = 0; i < filters.length; i++)
                    CheckboxListTile(
                      // secondary: const Icon(Icons.select_all),
                      autofocus: false,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      title: Text(
                        filters[i],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      value: selectedFilters[i],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedFilters[i] = value!;
                        });
                      },
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), 
                      ),
                      fixedSize: const Size.fromWidth(300),
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    onPressed: () {
                      // Implement filter logic here
                      // Fetch API data based on selected filters
                      // Close the modal popup
                      projectsFuture = fetchData();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      filter_text!,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


}

// Widget _buildLoadingIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Center(child: CircularProgressIndicator()),
//     );
//   }

Widget YourCardWidget(BuildContext context, {required Map<String, dynamic> data}){


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
            child: ImageWithOverlayText(context, data),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['title']!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  fontFamily: "Ubuntu-Regular",
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data['subtitle']!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  height: 1.3,
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
}



Widget ImageWithOverlayText(context, data){

  return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Stack(
          children: [
            // projects list image
            Image.network(
              data['imagePath']!,
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width - 20,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Center(
                  child: Text('Failed to load image'),
                );
              },
            ),

            // projects image gradient
            Positioned(
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.blue.withOpacity(0), Colors.transparent],
                  ),
                ),
                width: 50,
                height: 200,
              ),
            ),

            // projects verify badget
            if(data['verify'] != null)
              const Positioned(
                right: 6,
                top: 6,
                child: Icon(
                  Icons.verified,
                  size: 20,
                  color: Colors.blue,
                )
              ),
            
            // projects list location icon
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                  ),
                ),
                height: 100,
                width: MediaQuery.of(context).size.width - 20,
              ),
            ),

            // projects location width pin icon
            Positioned(
              top: 170,
              left: 10,
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on, 
                    color: Colors.white, 
                    size: 12,
                  ),
                  const SizedBox(width: 5), 
                  Text(
                    data['location'] ?? 'Not Found.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
