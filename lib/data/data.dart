import 'package:flutter/material.dart';

// class UnbordingContent {
//   String image;
//   String title;
//   String discription;
//   Color backgroundColor;
//   UnbordingContent({
//     required this.image,
//     required this.title,
//     required this.discription,
//     required this.backgroundColor,
//   });
// }

// // Created By Flutter Baba
// List<UnbordingContent> contentsList = [
//   UnbordingContent(
//     backgroundColor: const Color(0xffF0CF69),
//     title: "Your first car without a driver's license",
//     image: 'assets/images/welcome-1.jpg',
//     discription: "Goes to meet people who just got their license",
//   ),
//   UnbordingContent(
//     backgroundColor: const Color(0xffB7ABFD),
//     title: 'Work Seamlessly',
//     image: 'assets/images/welcome-2.jpg',
//     discription: "Get your work done seamlessly without interruption",
//   ),
//   UnbordingContent(
//     backgroundColor: const Color(0xffEFB491),
//     title: 'Achieve Higher Goals',
//     image: 'assets/images/welcome-3.jpg',
//     discription:
//         "By boosting your producivity we help you achieve higher goals",
//   ),
//   UnbordingContent(
//     backgroundColor: const Color(0xff95B6FF),
//     title: 'Achieve Higher Goals',
//     image: 'assets/images/welcome-1.jpg',
//     discription:
//         "By boosting your producivity we help you achieve higher goals",
//   ),
// ];




// // Main Screen Carusel Data
// final List<Map<String, String>> imgList = [
//   {
//     'imagePath': 'assets/images/carusel-1.jpg',
//     'title': 'Apartment Design in King David, Tbilisi.',
//   },
//   {
//     'imagePath': 'assets/images/carusel-2.jpg',
//     'title': 'Apartment Design in Blox, Tbilisi.',
//   },
//   {
//     'imagePath': 'assets/images/carusel-3.jpg',
//     'title': 'Apartment Design In Poland Bernandynska.',
//   },
//   {
//     'imagePath': 'assets/images/carusel-4.jpg',
//     'title': 'Title 4',
//   },
//   {
//     'imagePath': 'assets/images/carusel-5.jpg',
//     'title': 'Title 5',
//   },
//   {
//     'imagePath': 'assets/images/carusel-6.jpg',
//     'title': 'Title 6',
//   },
// ];



// Projects Data list 


// All Projects Static Data
final List<Map<String, String>> projectsData = [
  {
    'imagePath': 'assets/images/carusel-1.jpg',
    'title': 'Apartment Design in King David, Tbilisi.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1'
  },
  {
    'imagePath': 'assets/images/carusel-2.jpg',
    'title': 'Apartment Design in Blox, Tbilisi.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '2'
  },
  {
    'imagePath': 'assets/images/carusel-3.jpg',
    'title': 'Apartment Design In Poland Bernandynska.',
    'subtitle': 'Music by Julie Gable. Lyrics by Sidney Stein.',
    'date': '12/12/12 23:34',
    'category': '1'
  },
];




// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProjectScreen extends StatefulWidget {
//   const ProjectScreen({Key? key}) : super(key: key);

//   @override
//   _ProjectScreenState createState() => _ProjectScreenState();
// }

// class _ProjectScreenState extends State<ProjectScreen> {
//   late List<Map<String, String>> projectsData;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the projectsData list by fetching data from Firestore
//     fetchDataFromFirestore();
//   }

//   void fetchDataFromFirestore() async {
//     // Access Firestore collection and get documents
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await FirebaseFirestore.instance.collection('your_collection_name').get();

//     // Iterate through documents and create a list of Map<String, String>
//     setState(() {
//       projectsData = querySnapshot.docs.map((doc) {
//         return {
//           'imagePath': doc['imagePath'],
//           'title': doc['title'],
//           'subtitle': doc['subtitle'],
//           'category': doc['category'],
//         };
//       }).toList();
//     });
//   }

