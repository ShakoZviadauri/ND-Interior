import 'package:flutter/material.dart';

var logoImage = 'assets/images/logo-2.jpg';



class QuizWidget extends StatelessWidget{
  const QuizWidget({Key? key, this.logoImage}) : super(key: key);

  final String? logoImage;

  void tabAction(){
    print('tab action');
  }

  @override
  Widget build(context) {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // colors: colors,
            colors: [Color.fromARGB(255, 108, 108, 108), Color.fromARGB(255, 3, 40, 70)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(     
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,    
              child: const Center(
                child: Text(
                    "Main App", 
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                ),
              ),
            ),
            Container(),   // Required some widget in between to float AppBar
            Positioned(    // To take AppBar Size only
              top: 45.0,
              left: 20.0,
              right: 20.0,
              child: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () { 
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => SecondRoute(),
                      ),
                    );
                  }, 
                  icon: Icon(
                    Icons.man_rounded, 
                    color: Theme.of(context).primaryColor,
                  )
                ),
                primary: false,
                elevation: 0,
                title: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                    color: Colors.grey),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search, 
                      color: Theme.of(context).primaryColor), 
                      onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications, 
                      color: Theme.of(context).primaryColor),
                      onPressed: () {},
                  ),
                ],
              ),
            )

          ],
        ),
      );
  }

}

// appBar: AppBar(
//           title: const Text("კითხვები"),
//           titleTextStyle: const TextStyle(
//             color: Color.fromARGB(255, 255, 255, 255), 
//             fontFamily: 'NotoSansGeorgian',
//           ),
//           backgroundColor: const Color.fromARGB(255, 108, 8, 1),
//           elevation: 0,
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//             // colors: colors,
//             colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 3, 40, 70)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//           ),
//           child: Text('pirveli gverdi'),
//         ),
//       );


class SecondRoute extends StatelessWidget{
  const SecondRoute({super.key});
  

  
  @override
  Widget build(context) {
      return Container(
        // padding: EdgeInsets.all(20),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            foregroundColor: Colors.black,
            leading: IconButton(
              onPressed: () { 
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => QuizWidget(),
                  ),
                );
              },  
              icon: const Icon(Icons.arrow_back)
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () { 
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => QuizWidget(),
                    ),
                  );
                },  
                icon: const Icon(Icons.home),
                color: Colors.blue,
              ),
            ],
            title: Text('Contact'),
            titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), 
              fontFamily: 'NotoSansGeorgian',
              fontSize: 19,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: const Center(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('We move under cover and we move as one'),
                  Text('Through the night, we have one shot to live another day'),
                  Text('We cannot let a stray gunshot give us away'),
                  Text('We will fight up close, seize the moment and stay in it'),
                  Text('It’s either that or meet the business end of a bayonet'),
                  Text('The code word is ‘Rochambeau,’ dig me?'),
                  // Text('Rochambeau!', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
                ],
              ),
            ),
          ),
        ),
      );
  }

}





// class DialogExample extends StatelessWidget {
//   const DialogExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         TextButton(
//           onPressed: () => showDialog<String>(
//             context: context,
//             builder: (BuildContext context) => Dialog(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const Text('This is a typical dialog.'),
//                     const SizedBox(height: 15),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Close'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           child: const Text('Show Dialog'),
//         ),
//         const SizedBox(height: 10),
//         TextButton(
//           onPressed: () => showDialog<String>(
//             context: context,
//             builder: (BuildContext context) => Dialog.fullscreen(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text('This is a fullscreen dialog.'),
//                   const SizedBox(height: 15),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text('Close'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           child: const Text('Show Fullscreen Dialog'),
//         ),
//       ],
//     );
//   }
// }
