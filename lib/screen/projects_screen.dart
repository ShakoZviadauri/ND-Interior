import 'package:flutter/material.dart';
import 'package:n_design/screen/living_room_screen.dart'; //Living Room Screen


class ProjectScreen extends StatelessWidget{
  const ProjectScreen({super.key});
  
  @override
  Widget build(context){

    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          
          backgroundColor: HexColor("#fafafa"),
          // toolbarHeight: 100,
          elevation: 0,
          // leadingWidth: 90,
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
            ), // Custom back icon
            onPressed: () {
                Navigator.pushNamed(context, '/');
            },
          ),
          actions: <Widget>[
            IconButton(
              // padding: ,
              icon: const Icon(
                Icons.calendar_month, 
                color: Colors.black,
              ), // Add your desired icon here
              onPressed: () {
                // Implement the action for the right-side icon here
                // This function will execute when the icon is pressed
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              


                Card(
                  elevation: 0.5,
                  margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5)), // Set the border radius here
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push( 
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(), // Replace DetailPage with your detail page widget
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/carusel-1.jpg', // Replace with your image URL
                            fit: BoxFit.cover,
                            height: 250, // Set the image height as needed
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      const ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Apartment Design in King David, Tbilisi.',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                fontFamily: "Ubuntu-Regular",
                              ),
                            ),
                            SizedBox(height: 10), // Adjust the height for desired vertical space
                            Text(
                              'Music by Julie Gable. Lyrics by Sidney Stein.',
                              style: TextStyle(
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
                ),


                Card(
                  elevation: 0.5,
                  margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        child: GestureDetector(
                          onTap: () {
                            print('Image 1');
                          },
                          child: Image.asset(
                            'assets/images/carusel-2.jpg', // Replace with your image URL
                            fit: BoxFit.cover,
                            height: 250, // Set the image height as needed
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      const ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Apartment Design in Blox, Tbilisi.',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                fontFamily: "Ubuntu-Regular",
                              ),
                            ),
                            SizedBox(height: 10), // Adjust the height for desired vertical space
                            Text(
                              'Music by Julie Gable. Lyrics by Sidney Stein.',
                              style: TextStyle(
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
                ),


                Card(
                  elevation: 0.5,
                  margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        child: GestureDetector(
                          onTap: () {
                            print('Image 1');
                          },
                          child: Image.asset(
                            'assets/images/carusel-3.jpg', // Replace with your image URL
                            fit: BoxFit.cover,
                            height: 250, // Set the image height as needed
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      const ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Apartment Design In Poland Bernandynska.',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                fontFamily: "Ubuntu-Regular",
                              ),
                            ),
                            SizedBox(height: 10), // Adjust the height for desired vertical space
                            Text(
                              'Music by Julie Gable. Lyrics by Sidney Stein.',
                              style: TextStyle(
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
                ),              


              
            ],
          ),
        ),
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


class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,//change your color here
        ),
        title: const Text(
          'Detail Page',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: const Center(
        child: Text('Detail Page Content'),
      ),
    );
  }
}