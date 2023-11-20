import 'package:flutter/material.dart';

class LivingRoomScreen extends StatelessWidget{
  const LivingRoomScreen({super.key});
  
  @override
  Widget build(context){

    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Living Room Screen', style: TextStyle(color: Colors.black)),
      ),
    );

  }
}