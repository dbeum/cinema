import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema/hover.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Movie2 extends StatefulWidget {
  const Movie2({super.key});

  @override
  State<Movie2> createState() => _Movie2State();
}

class _Movie2State extends State<Movie2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: SingleChildScrollView(
      child: 
      Stack(
      children: [
       
        Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(left: 30,top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: Colors.black,width: 2),
            color: Colors.grey
          ),
          child: 
        Icon(Icons.person)
    ),
    SizedBox(height: 20,),
       Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0), // Adjust top padding as needed
            child: Text(
              'Now Available', // Use Unicode for the degree symbol
              style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
              
               
              ),
            ),
          ),
        ),

 Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider(
                    options: CarouselOptions(
                      height: 500.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1,
                    ),
            items:[
 Center(
          child: Container(
            margin: EdgeInsets.only(top:100),
            padding: EdgeInsets.all(4.0), // Adjust the border width here
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0), // Adjust the radius here
              border: Border.all(
                color: Colors.black, // Change the border color here
                width: 2.0, // Adjust the border thickness here
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Radius slightly smaller than container
              child: Image.asset(
                'images/creed.jpg',
                width: 1000, // Adjust the width if needed
                height: 450, // Adjust the height if needed
                fit: BoxFit.cover,
              ),
            ))
          ),
        
                    Center(
          child:  Container(
             margin: EdgeInsets.only(top:100),
            padding: EdgeInsets.all(4.0), // Adjust the border width here
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0), // Adjust the radius here
              border: Border.all(
                color: Colors.black, // Change the border color here
                width: 2.0, // Adjust the border thickness here
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Radius slightly smaller than container
              child: Image.asset(
                'images/wolve.jpg',
                width: 1000, // Adjust the width if needed
                height: 450, // Adjust the height if needed
                fit: BoxFit.cover,
              ),
            ))
        ),
         Center(
          
          child:  Container(
             margin: EdgeInsets.only(top:100),
            padding: EdgeInsets.all(4.0), // Adjust the border width here
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0), // Adjust the radius here
              border: Border.all(
                color: Colors.black, // Change the border color here
                width: 2.0, // Adjust the border thickness here
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Radius slightly smaller than container
              child: Image.asset(
                'images/me.jpg',
                width: 1000, // Adjust the width if needed
                height: 450, // Adjust the height if needed
                fit: BoxFit.cover,
              ),
            ))
        )
       ],
        )),
      Container(
        margin: EdgeInsets.only(top: 550),
        child: 
 Column(
  children: [
  Text('Drama',style: GoogleFonts.poppins(textStyle:TextStyle( fontWeight: FontWeight.normal,fontSize: 20),) ),
   
           Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      autoPlay: false,
                     initialPage: 2,
                      enlargeCenterPage: false,
                      aspectRatio: 4/3,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: .2,
                    ),
            items:[
   HoverExpandImage(
              imagePath: 'images/creed1.png',
              width: 200,
              height: 250,
              text: 'Inside Out 2',
              text2: 'PG',
              imagePath2: 'images/rate.png',
               text3: '4.7',
            ),
      
        HoverExpandImage(
              imagePath: 'images/stree1.jpg',
              width: 200,
              height: 250,
              text: 'Stree 2',
              text2: 'PG',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
           HoverExpandImage(
              imagePath: 'images/what1.jpg',
              width: 200,
              height: 250,
              text: 'What about us?',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '3.5',
            ),
              HoverExpandImage(
              imagePath: 'images/boss1.jpg',
              width: 200,
              height: 250,
              text: 'Move Like A Boss',
              text2: '12A',
               imagePath2: 'images/rate.png',
                text3: '4.1',
            ),
              HoverExpandImage(
              imagePath: 'images/border1.png',
              width: 200,
              height: 250,
              text: 'Borderlands',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '3.9',
            ),
              HoverExpandImage(
              imagePath: 'images/glad1.jpg',
              width: 200,
              height: 250,
              text: 'Gladiator II',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '3.9',
            ),
       ],
        ),)
  ],
 ),
 ),
   Container(
        margin: EdgeInsets.only(top: 900),
        child: 
 Column(
  children: [
    Text('Action',style: GoogleFonts.poppins(textStyle:TextStyle( fontWeight: FontWeight.normal,fontSize: 20),) ),

           Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider(
                    options: CarouselOptions(
                      height: 350.0,
                      autoPlay: false,
                     initialPage: 2,
                      enlargeCenterPage: false,
                      aspectRatio: 4/3,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: .2,
                    ),
            items:[
     HoverExpandImage(
              imagePath: 'images/wolve1.jpg',
              width: 200,
              height: 250,
              text: 'DeadPool & Wolverine',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '4.8',
            ),
      
          HoverExpandImage(
              imagePath: 'images/border1.png',
              width: 200,
              height: 250,
              text: 'Borderlands',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
              HoverExpandImage(
              imagePath: 'images/alien1.png',
              width: 200,
              height: 250,
              text: 'Alien',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
               HoverExpandImage(
              imagePath: 'images/quiet1.jpg',
              width: 200,
              height: 250,
              text: 'A Quiet Place Day One',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
                HoverExpandImage(
              imagePath: 'images/one1.jpg',
              width: 200,
              height: 250,
              text: 'Transformer One',
              text2: 'PG',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
             HoverExpandImage(
              imagePath: 'images/glad1.jpg',
              width: 200,
              height: 250,
              text: 'Gladiator II',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '3.9',
            ),
       ],
        ),)
  ],
 ),
 ),
    Container(
        margin: EdgeInsets.only(top: 1250),
        child: 
 Column(
  children: [
   Text('Thriller',style: GoogleFonts.poppins(textStyle:TextStyle( fontWeight: FontWeight.normal,fontSize: 20),)) ,
   
           Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider(
                    options: CarouselOptions(
                      height: 350.0,
                      autoPlay: false,
                     initialPage: 2,
                      enlargeCenterPage: false,
                      aspectRatio: 4/3,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: .2,
                    ),
            items:[
      
         HoverExpandImage(
              imagePath: 'images/border1.png',
              width: 200,
              height: 250,
              text: 'Borderlands',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
              HoverExpandImage(
              imagePath: 'images/alien1.png',
              width: 200,
              height: 250,
              text: 'Alien',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '4.3',
            ),
              HoverExpandImage(
              imagePath: 'images/trap1.jpg',
              width: 200,
              height: 250,
              text: 'TRAP',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
       ],
        ),)
  ],
 ),
 ),
  Container(
        margin: EdgeInsets.only(top: 1600),
        child: 
 Column(
  children: [
    Text('Family',style: GoogleFonts.poppins(textStyle:TextStyle( fontWeight: FontWeight.normal,fontSize: 20),) ),

           Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider(
                    options: CarouselOptions(
                      height: 350.0,
                      autoPlay: false,
                     initialPage: 2,
                      enlargeCenterPage: false,
                      aspectRatio: 4/3,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: .2,
                    ),
            items:[
     HoverExpandImage(
              imagePath: 'images/sun1.png',
              width: 200,
              height: 250,
              text: 'Inspector Sun',
              text2: 'PG',
               imagePath2: 'images/rate.png',
                text3: '4.8',
            ),
      
          HoverExpandImage(
              imagePath: 'images/me1.jpg',
              width: 200,
              height: 250,
              text: 'Dispicable ME 4',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
              HoverExpandImage(
              imagePath: 'images/one1.jpg',
              width: 200,
              height: 250,
              text: 'Transformer One',
              text2: 'PG',
               imagePath2: 'images/rate.png',
                text3: '4.5',
            ),
       ],
        ),)
  ],
 ),
 ),
    Container(
        margin: EdgeInsets.only(top: 1950),
        child: 
 Column(
  children: [
    Text('Coming Soon',  style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 25, fontWeight: FontWeight.normal))) ,
           Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider(
                    options: CarouselOptions(
                      height: 350.0,
                      autoPlay: false,
                    initialPage: 1,
                      enlargeCenterPage: false,
                      aspectRatio: 4/3,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: .2,
                    ),
            items:[
  HoverExpandImage(
              imagePath: 'images/wild1.jpg',
              width: 200,
              height: 250,
              text: 'The Wild Robot',
              text2: 'PG',
               imagePath2: 'images/rate.png',
                text3: '',
            ),
       HoverExpandImage(
              imagePath: 'images/afraid1.jpg',
              width: 200,
              height: 250,
              text: 'Afraid',
              text2: '18',
               imagePath2: 'images/rate.png',
                text3: '',
            ),
         
       ],
        ),)
  ],
 ),
 ),
      
      ],
     
    )  ) 
    );
  }
}