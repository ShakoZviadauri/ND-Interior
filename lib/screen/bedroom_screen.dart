import 'package:flutter/material.dart';

class BedroomScreen extends StatelessWidget{
  const BedroomScreen({super.key});
  
  @override
  Widget build(context){

    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Bedroom Screen', style: TextStyle(color: Colors.black)),
      ),
    );

  }
}