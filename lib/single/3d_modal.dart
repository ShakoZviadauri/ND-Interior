// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'package:n_design/data/data.dart';
import 'package:n_design/services/localization_service.dart';

class ThreedView extends StatefulWidget {
  final int id;
  final LocalizationService localizationService;

  const ThreedView({
    Key? key,
    required this.id,
    required this.localizationService,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThreedViewState createState() => _ThreedViewState();
}

class _ThreedViewState extends State<ThreedView> {
  late Future<Map<String, dynamic>> threedmodelDetailsFuture;
  LocalizationService localizationService = LocalizationService.getInstance();

  @override
  void initState() {
    super.initState();
    _fetchThreedmodelDetails(widget.id);
  }

  Future<void> _fetchThreedmodelDetails(int id) async {
    threedmodelDetailsFuture = ThreedmodelService.fetchThreedmodelDetails(id, localizationService);
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D View'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: threedmodelDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            // Use the fetched data to build your UI
            return Scaffold(
              body: Center(
                // child: Text(data['model']),
                child: ModelViewer(
                  src: data['model'], 
                  alt: '3D Modal',
                  autoRotate: true,
                  cameraControls: true,
                  backgroundColor: Colors.white,
                  ar: true, 
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

  
