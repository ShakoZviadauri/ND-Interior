import 'package:flutter/material.dart';

class BathroomScreen extends StatelessWidget{
  const BathroomScreen({super.key});
  
  @override
  Widget build(context){

    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Bathroom Screen', style: TextStyle(color: Colors.black)),
      ),
    );

  }
}