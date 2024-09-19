import 'package:cinema/home.dart';
import 'package:flutter/material.dart';
import 'package:cinema/hover2.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
class info extends StatefulWidget {
 //  final String imagePath;
  // final String text;
  // final String text2;
 

  info({
    // required this.imagePath,
    // required this.text,
    //   required this.text2,
    super.key
  });
 

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
   

  @override
  Widget build(BuildContext context) { 
      
       return Theme(
      data: Theme.of(context).copyWith(
      
      ),
       child:  ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileNavBar(),
      desktop: (BuildContext context) => DeskTopNavBar(),
       ));
  }


  Widget MobileNavBar() {
    return   Scaffold(
     body: SingleChildScrollView(
        child: 
        Stack(
children: [
//   Container(
//     margin:EdgeInsets.only(top: 20,left:30) ,
//     height: 40,
//     width: 40,
//     decoration: BoxDecoration(    color: Colors.white,

//       borderRadius: BorderRadius.all(Radius.circular(10))
//     ),
//     child:Center(child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),)), child:  Icon(Icons.arrow_back,color: Colors.black,)),),
//   ),
//   Column(
   
//     children: [
//   Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
  
//     Container(
//       height: 200,width: 150,
//       margin: EdgeInsets.only(top:90),
//       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),),
//       child: ClipRRect(
//   borderRadius: BorderRadius.circular(15.0), // Adjust the value for more or less rounding
//   child: Image.asset(
//     // widget.imagePath,
//     fit: BoxFit.fill,
//   ),
// )),

   Container(
      margin: EdgeInsets.only(top:90),
    child: 
    Column(
   
      children: [
      // Text(widget.text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        // Text('Rating: '+ widget.text2,style: TextStyle(fontSize: 10),),
      Text('1hr 36m • USA • 2023',style: TextStyle(fontSize: 10),),
      Text('Actor 1 Name',style: TextStyle(fontSize: 10),),
      Text('Actor 2 Name',style: TextStyle(fontSize: 10),),
Text('Actor 3 Name',style: TextStyle(fontSize: 10),),
Text('Director ',style: TextStyle(fontSize: 10),),
Text('Release: August 23, 2024',style: TextStyle(fontSize: 10),),
Text('Language:English',style: TextStyle(fontSize: 10),)
    ],)),
//   ],),
// Container(
//   padding: EdgeInsets.all(16),
//   child: Text('The Journey Begins follows the story of a young adventurer, Alex, who embarks on a quest to discover hidden secrets of an ancient civilization. Along the way, Alex encounters thrilling challenges, mysterious allies, and a race against time to unlock the truth that could change the world forever. ')),
  
  Container(height: 2,
  width: 450,
  color: Colors.grey,),
  SizedBox(height: 10),
 
 Container(
  margin: EdgeInsets.only(left: 30),
  child: Column(
    
    children: [
     Text('Cinema',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
 Text('Silverbird Cinema,Ikeja')
  ],),
 ),
 SizedBox(height: 10,),
  Row(
   
    children: [
      SizedBox(width: 10),
      Container(
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black,width: 1)
        ),
        child: Column(children: [
          Text('Thur',style:TextStyle( color:Colors.black),),
          Text('Sep',style:TextStyle( color:Colors.black)),
          Text('2',style:TextStyle( color:Colors.black))
        ],),
      ),
       SizedBox(width: 10),
      Container(
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black,width: 1)
        ),
        child: Column(children: [
          Text('Fri',style:TextStyle( color:Colors.black),),
          Text('Sep',style:TextStyle( color:Colors.black)),
          Text('3',style:TextStyle( color:Colors.black))
        ],),
      ),
     
    ],
  ),
  SizedBox(height: 20,),
  Text('Silverbird Cinema,Abuja'),

 SizedBox(height: 10,),
  Row(
   
    children: [
      SizedBox(width: 10),
      Container(
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black,width: 1)
        ),
        child: Column(children: [
          Text('Thur',style:TextStyle( color:Colors.black),),
          Text('Sep',style:TextStyle( color:Colors.black)),
          Text('2',style:TextStyle( color:Colors.black))
        ],),
      ),
       SizedBox(width: 10),
      Container(
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black,width: 1)
        ),
        child: Column(children: [
          Text('Fri',style:TextStyle( color:Colors.black),),
          Text('Sep',style:TextStyle( color:Colors.black)),
          Text('3',style:TextStyle( color:Colors.black))
        ],),
      ),
     
    ],
  ),
  SizedBox(height: 20,),  
 ElevatedButton(onPressed: () {
   
 }, 
  style: ElevatedButton.styleFrom(
  
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside the button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15), // Button border radius
    ),
  ),
 child: Text('Book',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),)),
 SizedBox(height: 10,)
  ])  
// ],
        ),
      
      // ),
    );
  }

  Widget DeskTopNavBar() {
    return Scaffold(
//      body: SingleChildScrollView(
//         child: 
//         Stack(
// children: [
//   Container(
//     margin:EdgeInsets.only(top: 20,left:30) ,
//     height: 40,
//     width: 40,
//     decoration: BoxDecoration(    color: Colors.white,

//       borderRadius: BorderRadius.all(Radius.circular(10))
//     ),
//     child: Icon(Icons.arrow_back,color: Colors.black,),
//   ),
//   Column(
   
//     children: [
//   Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
  
//     Container(
//       height: 400,width: 300,
//       margin: EdgeInsets.only(top:90),
//       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),),
//       child: ClipRRect(
//   borderRadius: BorderRadius.circular(15.0), // Adjust the value for more or less rounding
//   child: Image.asset(
//     widget.imagePath,
//     fit: BoxFit.fill,
//   ),
// )),

//    Container(
//       margin: EdgeInsets.only(top:90),
//     child: 
//     Column(
   
//       children: [
//       Text(widget.text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
//         Text('Rating: '+ widget.text2,style: TextStyle(fontSize: 15),),
//       Text('1hr 36m • USA • 2023',style: TextStyle(fontSize: 15),),
//       Text('Actor 1 Name',style: TextStyle(fontSize: 15),),
//       Text('Actor 2 Name',style: TextStyle(fontSize: 15),),
// Text('Actor 3 Name',style: TextStyle(fontSize: 15),),
// Text('Director ',style: TextStyle(fontSize: 15),),
// Text('Release: August 23, 2024',style: TextStyle(fontSize: 15),),
// Text('Language:English',style: TextStyle(fontSize: 15),),
// SizedBox(height: 20,),
//  ElevatedButton(onPressed: () {
   
//  }, 
//   style: ElevatedButton.styleFrom(
  
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside the button
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15), // Button border radius
//     ),
//   ),
//  child: Text('Book',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),)),
 
//     ],)),
//   ],),
// Container(
//   padding: EdgeInsets.all(16),
//   child: Text('The Journey Begins follows the story of a young adventurer, Alex, who embarks on a quest to discover hidden secrets of an ancient civilization. Along the way, Alex encounters thrilling challenges, mysterious allies, and a race against time to unlock the truth that could change the world forever. ')),
  
//   Container(height: 2,
//   width: 450,
//   color: Colors.grey,),
//   SizedBox(height: 10),
 
//  Container(
//   margin: EdgeInsets.only(left: 30),
//   child: Column(
    
//     children: [
//      Text('Cinema',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
//  Text('Silverbird Cinema,Ikeja')
//   ],),
//  ),
//  SizedBox(height: 10,),
//   Row(
   
//     children: [
//       SizedBox(width: 10),
//       Container(
//         height: 70,
//         width: 150,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(5)),border: Border.all(color: Colors.black,width: 1)
//         ),
//         child: Column(children: [
//           Text('Thur',style:TextStyle( color:Colors.black),),
//           Text('Sep',style:TextStyle( color:Colors.black)),
//           Text('2',style:TextStyle( color:Colors.black))
//         ],),
//       ),
//        SizedBox(width: 10),
//       Container(
//         height: 70,
//         width: 150,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(5)),border: Border.all(color: Colors.black,width: 1)
//         ),
//         child: Column(children: [
//           Text('Fri',style:TextStyle( color:Colors.black),),
//           Text('Sep',style:TextStyle( color:Colors.black)),
//           Text('3',style:TextStyle( color:Colors.black))
//         ],),
//       ),
     
//     ],
//   ),
//   SizedBox(height: 20,),
//   Text('Silverbird Cinema,Abuja'),

//  SizedBox(height: 10,),
//   Row(
   
//     children: [
//       SizedBox(width: 10),
//       Container(
//         height: 70,
//         width: 150,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(5)),border: Border.all(color: Colors.black,width: 1)
//         ),
//         child: Column(children: [
//           Text('Thur',style:TextStyle( color:Colors.black),),
//           Text('Sep',style:TextStyle( color:Colors.black)),
//           Text('2',style:TextStyle( color:Colors.black))
//         ],),
//       ),
//        SizedBox(width: 10),
//       Container(
//         height: 70,
//         width: 150,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(5)),border: Border.all(color: Colors.black,width: 1)
//         ),
//         child: Column(children: [
//           Text('Fri',style:TextStyle( color:Colors.black),),
//           Text('Sep',style:TextStyle( color:Colors.black)),
//           Text('3',style:TextStyle( color:Colors.black))
//         ],),
//       ),
     
//     ],
//   ),
//   SizedBox(height: 20,),  

//   ])  
// ],
//         ),
      
//       ),
    );
  }
}












 