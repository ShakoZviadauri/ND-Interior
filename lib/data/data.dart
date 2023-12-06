import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:n_design/services/localization_service.dart';


// All Projects Static Data
final List<Map<String, dynamic>> projectsData = [
  {
    'id' : '1',
    'imagePath': 'assets/images/carusel-1.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment Design in King David.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1',
    'location': 'Tbilisi, Georgia',
    'likes': 0,
    'model': 'assets/3d_models/interior_scene_1.glb',
  },
  {
    'id' : '2',
    'imagePath': 'assets/images/carusel-2.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment Design in Blox.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '2',
    'location': 'Canada',
    'likes': 0,
    'model': 'assets/3d_models/interior_scene_2.glb',
  },
  {
    'id' : '3',
    'imagePath': 'assets/images/carusel-1.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment Design in King David.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1',
    'location': 'Tbilisi, Georgia',
    'likes': 0,
    'model': 'assets/3d_models/interior_scene_3.glb',
  },
  {
    'id' : '4',
    'imagePath': 'assets/images/carusel-2.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment Design.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1',
    'location': 'Poland Bernandynska',
    'likes': 0,
    'model': 'assets/3d_models/interior_scene_4.glb',
  },
  {
    'id' : '5',
    'imagePath': 'assets/images/carusel-3.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment 3XBUILD.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1',
    'location': 'San Antonio, Texas',
    'likes': 0,
    'model': 'assets/3d_models/interior_scene_1.glb',
  },
  {
    'id' : '6',
    'imagePath': 'assets/3d_assets/model_1w.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment 3XBUILD.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1',
    'location': 'San Antonio, Texas',
    'likes': 0,
    'model': 'assets/3d_models/model_n2.glb',
  },
  {
    'id' : '7',
    'imagePath': 'assets/3d_assets/model_1e.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment Test N1.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1',
    'location': 'San Antonio, Texas',
    'likes': 0,
    'model': 'assets/3d_models/INTERIOR.glb',
  },
  {
    'id' : '8',
    'imagePath': 'assets/3d_assets/model_1t.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment Test N1.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1',
    'location': 'San Antonio, Texas',
    'likes': 0,
    'model': 'assets/3d_models/model_n3.glb',
  },
  {
    'id' : '9',
    'imagePath': 'assets/3d_assets/model_1y.jpg',
    'scheme': 'assets/images/scheme_2.jpg',
    'title': 'Apartment Test N1.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1',
    'location': 'San Antonio, Texas',
    'likes': 0,
    'model': 'assets/3d_models/building_set.glb',
  },

];


final List<Map<String, dynamic>> projectSubImages = [
  {
    "id": "1",
    "images": [
      "assets/images/carusel-3.jpg", 
      "assets/images/carusel-6.jpg"
    ]
  },
  {
    "id": "2",
    "images": [
      "assets/images/carusel-3.jpg", 
      "assets/images/carusel-6.jpg"
    ]
  },
  {
    "id": "3",
    "images": [
      "assets/images/carusel-3.jpg", 
      "assets/images/carusel-6.jpg",
      "assets/images/carusel-6.jpg"
    ]
  },
  {
    "id": "6",
    "images": [
      "assets/3d_assets/model_1w.jpg", 
      "assets/3d_assets/model_2w.jpg"
    ]
  },
  {
    "id": "7",
    "images": [
      "assets/3d_assets/model_1e.jpg", 
      "assets/3d_assets/model_2e.jpg",
      "assets/3d_assets/model_3e.jpg"
    ]
  },
  {
    "id": "8",
    "images": [
      "assets/3d_assets/model_1t.jpg",
      "assets/3d_assets/model_2t.jpg",
      "assets/3d_assets/model_3t.jpg",
      "assets/3d_assets/model_4t.jpg",
      "assets/3d_assets/model_5t.jpg"
    ]
  },
  {
    "id": "9",
    "images": [
      "assets/3d_assets/model_1y.jpg",
      "assets/3d_assets/model_2y.jpg",
      "assets/3d_assets/model_3y.jpg",
    ]
  }
];





const String apiKey = 'br89q4b9gb';
LocalizationService localizationService = LocalizationService.getInstance();


class ApiHelper {
  static Future<List<Map<String, dynamic>>> fetchProjectsData(localizationService) async {

    Locale languageKey = localizationService.getLocale();

    const String apiUrl = 'https://ndinterior.design/api/3dmodels';
    List<Map<String, dynamic>> projectsData = [];

    print(languageKey);

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
          'X-Your-Custom-API-Key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON response and populate projectsData
        final jsonData = json.decode(response.body);
        // print(jsonData);
        // Assuming your API response is a list of projects
        projectsData = List<Map<String, dynamic>>.from(jsonData);
      } else {
        // Handle error cases
        // ignore: avoid_print
        print('Request faile, status code: ${response.statusCode}');
        // You can return an empty list or handle errors as needed
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception caught: $e');
    }

    return projectsData;
  }

  static fetchThreedmodelDetails() {}
}




class ThreedmodelService {
  static Future<Map<String, dynamic>> fetchThreedmodelDetails(int threedmodelId, localizationService) async {

    final String apiUrl = 'https://ndinterior.design/api/3dmodels/$threedmodelId'; // Replace with your API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
          'X-Your-Custom-API-Key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final threedmodelDetailsData = json.decode(response.body);
        return threedmodelDetailsData;
      } else {
        throw Exception('Failed to fetch threedmodel details');
      }
    } catch (e) {
      throw Exception('Error message: $e');
    }
  }
}