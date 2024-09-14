import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cinema extends StatefulWidget {
  const cinema({super.key});

  @override
  State<cinema> createState() => _cinemaState();
}

class _cinemaState extends State<cinema> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: 
        Stack(
children: [
  Container(
    margin:EdgeInsets.only(top: 20,left:30) ,
    height: 40,
    width: 40,
    decoration: BoxDecoration(    color: Colors.white,

      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Icon(Icons.arrow_back,color: Colors.black,),
  ),
  SizedBox(height: 10,),
  Row(children: [
    
  ],)
],
        ),
      
      ),
    );
  }
}