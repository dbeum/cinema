import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
         Text('Email',style: TextStyle(fontSize: 20),),
         SizedBox(height: 10,),
            Text('Email',style: TextStyle(fontSize: 20),),
         SizedBox(height: 10,),
        ],
      ),
    );
  }
}