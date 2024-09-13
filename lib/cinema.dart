import 'package:flutter/material.dart';

class cinema extends StatefulWidget {
  const cinema({super.key});

  @override
  State<cinema> createState() => _cinemaState();
}

class _cinemaState extends State<cinema> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:Text('info')
      ),
    );
  }
}