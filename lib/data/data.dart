import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:n_design/services/localization_service.dart';





const String apiKey = 'Your key';
LocalizationService localizationService = LocalizationService.getInstance();



// Get Main Carusel Data
class ApiHelperMainCarusel {

  static Future<List<Map<String, dynamic>>> fetchProjectsData(localizationService) async {

    // Locale languageKey = localizationService.getLocale();
    // print(languageKey);
    // print(pageID);

    final String apiUrl = 'https://ndinterior.design/api/3dmodels/carusel/last';
    List<Map<String, dynamic>> projectsData = [];


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
        final jsonData = json.decode(response.body);
        projectsData = List<Map<String, dynamic>>.from(jsonData);
      } else {
        print('Request faile, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
    return projectsData;
  }
  static fetchThreedmodelDetails() {}
}



// Get projects List


class ApiHelper {

  static Future<List<Map<String, dynamic>>> fetchProjectsData(localizationService, int pageID) async {

    // Locale languageKey = localizationService.getLocale();
    // print(languageKey);
    // print(pageID);

    final String apiUrl = 'https://ndinterior.design/api/3dmodels/$pageID';
    List<Map<String, dynamic>> projectsData = [];

    // print(languageKey);

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

    final String apiUrl = 'https://ndinterior.design/api/3dmodelsdetail/$threedmodelId'; // Replace with your API endpoint



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
        print(response.statusCode);
        throw Exception('Failed to fetch threedmodel details');
      }
    } catch (e) {
      throw Exception('Error message: $e');
    }
  }
}