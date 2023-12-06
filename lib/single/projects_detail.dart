// import 'dart:ffi';
// import 'dart:io';
// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:n_design/data/data.dart';
import 'package:n_design/single/3d_modal.dart';

import 'package:photo_view/photo_view.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:n_design/services/localization_service.dart';


class ProjectsDetailPage extends StatefulWidget {
  const ProjectsDetailPage({Key? key}) : super(key: key);

  @override
  _ProjectsDetailPageState createState() => _ProjectsDetailPageState();
}

class _ProjectsDetailPageState extends State<ProjectsDetailPage> {

  List<Map<String, dynamic>> threedmodelDetailsData = [];
  late int projectsID;
  late Future<Map<String, dynamic>> threedmodelDetailsFuture;
  late int likes = 0;
  LocalizationService localizationService = LocalizationService.getInstance();
  // final String url;

  @override
  void initState() {
    super.initState();
  }


  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url as Uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments != null && arguments.containsKey('id')) {
      final id = arguments['id'];
      if (id != null && id is int) {
        projectsID = id;
        _fetchThreedmodelDetails();
      } else {
        Navigator.pop(context); // Example: Navigate back if the ID is not valid
      }
    } else {
      Navigator.pop(context); // Example: Navigate back if the ID is not provided
    }
  }

  Future<void> _fetchThreedmodelDetails() async {
    threedmodelDetailsFuture = ThreedmodelService.fetchThreedmodelDetails(projectsID, localizationService);
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Project Detail'),
      // ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: threedmodelDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
          
            return const Center(child: CircularProgressIndicator());
          
          } else if (snapshot.hasError) {
            
            return Center(child: Text('Error: ${snapshot.error}'));

          } else if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data!;
            if (data.containsKey('id')) {
              return SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      
                      Container(
                        width: double.infinity,
                        height: size.height * 0.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data['imagePath']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 43,
                                    height: 43,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.white.withOpacity(0.5)),
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.white,),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[

                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ThreedView(
                                                id: data['id'],
                                                localizationService: localizationService,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 43,
                                          height: 43,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.5),
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            border: Border.all(color: Colors.white.withOpacity(0.5)),
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.threed_rotation, size: 20, color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 2,),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ThreedView(
                                                id: data['id'],
                                                localizationService: localizationService,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 43,
                                          height: 43,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.5),
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            border: Border.all(color: Colors.white.withOpacity(0.5)),
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.favorite_border, size: 20, color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 2,),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ThreedView(
                                                id: data['id'],
                                                localizationService: localizationService,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 43,
                                          height: 43,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.5),
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            border: Border.all(color: Colors.white.withOpacity(0.5)),
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.share, size: 20, color: Colors.white,),
                                          ),
                                        ),
                                      ),


                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      // After main Image Info

                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.50),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white, 
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                child: Container(
                                  width: 150,
                                  height: 0.5,
                                  decoration: BoxDecoration(
                                      color: HexColor("525FE1"),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                data['title'],
                                style: const TextStyle(
                                  fontSize: 25, 
                                  height: 1.5,
                                  fontFamily: "Ubuntu-Regular",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          shape: BoxShape.rectangle,
                                          image: const DecorationImage(
                                              image: AssetImage('assets/profile/n_demetradze.jpg'),
                                              fit: BoxFit.cover
                                            )
                                          ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Nina Demetradze",
                                            style: TextStyle(
                                                fontSize: 16, 
                                                fontWeight: 
                                                FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "Interior Designer",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // contact button

                                  InkWell(
                                      onTap: () async {
                                        String apiURL = data['profile_url'];
                                        Uri uri = Uri.parse(apiURL);
                                        
                                        await _launchInBrowser(uri);
                                      },
                                      child: Container(
                                        width: 43,
                                        height: 43,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(1),
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          border: Border.all(color: Colors.white.withOpacity(0.5)),
                                        ),
                                        child: const Center(
                                          child: Icon(Icons.add_link, size: 20, color: Colors.white,),
                                        ),
                                      ),
                                    ),


                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text("Interior"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child:const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text("40m2"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text("Ideas"),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 25,),
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data['scheme']!),
                                  )
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                data['description'] ,
                                style: const TextStyle(
                                  height: 1.6
                                ),
                              ),
                              const SizedBox(height: 20,),
                              const Text(
                                "Gallery",
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                              const SizedBox(height: 20,),

                              // SingleChildScrollView(
                              //   scrollDirection: Axis.horizontal,
                              //     child: Row(
                              //     children: paddingWidgets,
                              //   ),
                              // )
                              
                            
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
              );
            } else {
              return const Center(child: Text('No ID available'));
            }
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
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
