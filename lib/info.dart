import 'package:cinema/book.dart';
import 'package:cinema/home.dart';
import 'package:cinema/videoplayer.dart';
import 'package:cinema/youtubeplayer.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';


class info extends StatefulWidget {
 final Map<String, dynamic> movieDetails;
 

  info({
    required this.movieDetails
   
  });
 

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
   

  @override
  Widget build(BuildContext context) { 
   String? title = widget.movieDetails['title'];
    String? posterUrl = widget.movieDetails['poster_url'];
    String? description = widget.movieDetails['description'];
    String? actor1 = widget.movieDetails['Actor 1'];
    String? actor2 = widget.movieDetails['Actor 2'];
    String? actor3 = widget.movieDetails['Actor 3'];
    String? date = widget.movieDetails['Date'];
    String? language = widget.movieDetails['Language']??'';
    String? time = widget.movieDetails['Time'];
    String? genre = widget.movieDetails['genre'];
    String? posterUrl1 = widget.movieDetails['poster1_url'];
    String? rating = widget.movieDetails['rating'];
    String? director = widget.movieDetails['Director'];
    String? rating1 = widget.movieDetails['rating1'];
    String? yurl = widget.movieDetails['yurl'];
    String? showtime = widget.movieDetails['showtime'];
    String? showtimeday1 = widget.movieDetails['showtimeday1'];
    String? showtimemonth = widget.movieDetails['showtimemonth'];
    String? showtimeno = widget.movieDetails['showtimeno'];
    String? Hall = widget.movieDetails['Hall'];
    String? Hall2 = widget.movieDetails['Hall2'];
    String? showtime2 = widget.movieDetails['showtime2'];
    String? showtimeday2 = widget.movieDetails['showtimeday2'];
    String? showtimemonth2 = widget.movieDetails['showtimemonth2'];
    String? showtimeno2 = widget.movieDetails['showtimeno2'];
    String? price = widget.movieDetails['price'];
    String? cinema1 = widget.movieDetails['cinema1'];
    String? cinema2 = widget.movieDetails['cinema2'];








       return Theme(
      data: Theme.of(context).copyWith(
      
      ),
       child:  ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileNavBar(posterUrl,actor1,actor2,actor3,date,language,time,title,genre,posterUrl1,rating,rating1,description,yurl,director,showtime,showtimeday1,showtimemonth,showtimeno,showtime2,showtimeday2,showtimemonth2,showtimeno2,Hall,Hall2,price,cinema1,cinema2),
      desktop: (BuildContext context) => DeskTopNavBar(posterUrl,actor1,actor2,actor3,date,language,time,title,genre,posterUrl1,rating,rating1,description,yurl,director,showtime,showtimeday1,showtimemonth,showtimeno,showtime2,showtimeday2,showtimemonth2,showtimeno2,Hall,Hall2,price,cinema1,cinema2),
       ));
  }


  Widget MobileNavBar(String? posterUrl,actor1,actor2,actor3,date,language,time,genre,title,posterUrl1,rating,rating1,description,yurl,director,showtime,showtimeday1,showtimemonth,showtimeno,showtime2,showtimeday2,showtimemonth2,showtimeno2,Hall,Hall2,price,cinema1,cinema2) {
    return   Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent
      ,),
     body: SingleChildScrollView(
        child: 
        Stack(
children: [

  //    Container(
  //    margin:EdgeInsets.only(top: 20,left:30) ,
  //    height: 40,
  //    width: 40,
  //    decoration: BoxDecoration(    color: Colors.white,

  //      borderRadius: BorderRadius.all(Radius.circular(10))
  //    ),

  //    child:Center(child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),)), child:  Icon(Icons.arrow_back,color: Colors.black,)),),
  //  ),     
  
   Column(
   
     children: [
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
  
     Container(
       height: 200,width: 150,
       margin: EdgeInsets.only(top:90),
       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),),
       child: ClipRRect(
   borderRadius: BorderRadius.circular(15.0), // Adjust the value for more or less rounding
   child:  posterUrl != null
                ? Image.network(
      posterUrl,
     fit: BoxFit.fill,
   ) : Image.asset('images/placeholder.png'),
 )),

   Container(
      margin: EdgeInsets.only(top:90),
    child: 
    Column(
   
      children: [
      Text(genre,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
      Text(title,style: TextStyle(fontSize: 10),),
        Text('Rating: '+ rating +' • '+ rating1,style: TextStyle(fontSize: 10),),
       Text(time,style: TextStyle(fontSize: 10),),
       Text(actor1,style: TextStyle(fontSize: 10),),
       Text(actor2,style: TextStyle(fontSize: 10),),
 Text(actor3,style: TextStyle(fontSize: 10),),
 Text('Director: ' + director,style: TextStyle(fontSize: 10),),
 Text('Release: August 23, 2024',style: TextStyle(fontSize: 10),),
Text(language,style: TextStyle(fontSize: 10),)

    ],)),
   ],),
 Container(
   padding: EdgeInsets.all(16),
   child: Text(description)),
  
  Container(height: 2,
  width: 450,
  color: Colors.grey,),
  SizedBox(height: 5),
 
 Container(
   padding: EdgeInsets.all(16),
  child: Column(
    
    children: [
        Container(width: 400,height: 150,
        decoration: BoxDecoration(color: Colors.transparent),
    child: Center(
           child: Stack(children: [
            Positioned.fill(child: YouTubePlayer(
             yurl: yurl ?? ""),)
           ],)
         // child: VideoApp()
          )
          ),
    SizedBox(height:5  ,),
 Text(cinema1??'')
  ],),
 ),
  Container(height: 2,
  width: 300,
  color: Colors.grey,),

 SizedBox(height: 10,),


  Column(children: [

    Center(child: 
      Text('${showtimeday1??''} ${showtimeno??''},${showtimemonth}')
    ),
Row(
   
    children: [
      
      SizedBox(width: 10),
   TextButton(onPressed: () {
      Navigator.push(context,MaterialPageRoute(builder:(context) =>
        book( movieDetails:{
          ...widget.movieDetails,
         'selectedShowtime': showtime,
            'selectedShowtimeDay': showtimeday1,
            'selectedShowtimeMonth': showtimemonth,
            'selectedShowtimeNo': showtimeno,
            'selectedHall': Hall,
            'selectedCinema': cinema1,})
      ) );
    },
     style: TextButton.styleFrom(
  
    // padding: EdgeInsets.symmetric(horizontal: .5, vertical: 1), // Padding inside the button
   shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10), // Button border radius
     ),
   ),
     child:   Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),border: Border.all(width: 1),
        ),
        child: Center(child: 
         
          Text(showtime,style:TextStyle( color:Colors.black))
        ),
      ),),
       
     
    ],
  ),
  ],),
  SizedBox(height: 20,),
  Text(cinema2??''),
Container(height: 2,
  width: 300,
  color: Colors.grey,),
 SizedBox(height: 10,),
  Column(children: [

    Center(child: 
      Text('${showtimeday2??''} ${showtimeno2??''},${showtimemonth2}')
    ),
Row(
   
    children: [
      
      SizedBox(width: 10),
    TextButton(onPressed: () {
      Navigator.push(context,MaterialPageRoute(builder:(context) =>
        book( movieDetails:{
          ...widget.movieDetails,
         'selectedShowtime': showtime2,
            'selectedShowtimeDay': showtimeday2,
            'selectedShowtimeMonth': showtimemonth2,
            'selectedShowtimeNo': showtimeno2,
            'selectedHall': Hall2,
            'selectedCinema': cinema2})
      ) );
    },
     style: TextButton.styleFrom(
  
   //  padding: EdgeInsets.symmetric(horizontal: .5, vertical: 1), // Padding inside the button
   shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10), // Button border radius
     ),
   ),
     child:   Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
       borderRadius: BorderRadius.all(Radius.circular(5)),border: Border.all(width: 1),
        ),
        child: Center(child: 
         
          Text(showtime2,style:TextStyle( color:Colors.black))
        ),
      ),),
       
     
    ],
  ),
  ],),
  SizedBox(height: 20,),  

  ])  
 ],
        ),
      
      ),
    );
  }

  Widget DeskTopNavBar(String? posterUrl,actor1,actor2,actor3,date,language,time,title,genre,posterUrl1,rating,rating1,description,yurl,director,showtime,showtimeday1,showtimemonth,showtimeno,showtime2,showtimeday2,showtimemonth2,showtimeno2,Hall,Hall2,price,cinema1,cinema2) {
 
    return   Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent
      ,),
     body: SingleChildScrollView(
        child: 
        Stack(
children: [

  //    Container(
  //    margin:EdgeInsets.only(top: 20,left:30) ,
  //    height: 40,
  //    width: 40,
  //    decoration: BoxDecoration(    color: Colors.white,

  //      borderRadius: BorderRadius.all(Radius.circular(10))
  //    ),

  //    child:Center(child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),)), child:  Icon(Icons.arrow_back,color: Colors.black,)),),
  //  ),     
  
   Column(
   
     children: [
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
  
     Container(
       height: 300,width: 200,
       margin: EdgeInsets.only(top:90),
       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),),
       child: ClipRRect(
   borderRadius: BorderRadius.circular(15.0), // Adjust the value for more or less rounding
   child:  posterUrl != null
                ? Image.network(
      posterUrl,
     fit: BoxFit.fill,
   ) : Image.asset('images/placeholder.png'),
 )),

   Container(
      margin: EdgeInsets.only(top:90),
    child: 
    Column(
   
      children: [
      Text(genre,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
      Text(title,style: TextStyle(fontSize: 20),),
        Text('Rating: '+ rating +' • '+ rating1,style: TextStyle(fontSize: 20),),
       Text(time,style: TextStyle(fontSize: 20),),
       Text(actor1,style: TextStyle(fontSize: 20),),
       Text(actor2,style: TextStyle(fontSize: 20),),
 Text(actor3,style: TextStyle(fontSize: 20),),
 Text('Director: ' + director,style: TextStyle(fontSize: 20),),
 Text('Release: August 23, 2024',style: TextStyle(fontSize: 20),),
Text(language,style: TextStyle(fontSize: 20),)

    ],)),
   ],),
 Container(
   padding: EdgeInsets.all(16),
   child: Text(description,style: TextStyle(fontSize: 20),)),
  
  Container(height: 2,
  width: 450,
  color: Colors.grey,),
  SizedBox(height: 5),
 
 Container(
   padding: EdgeInsets.all(16),
  child: Column(
    
    children: [
        Container(width: 600,height: 150,
        decoration: BoxDecoration(color: Colors.transparent),
    child: Center(
           child: Stack(children: [
            Positioned.fill(child: YouTubePlayer(
             yurl: yurl ?? ""),)
           ],)
         // child: VideoApp()
          )
          ),
    SizedBox(height:5  ,),
 Text(cinema1??'')
  ],),
 ),
  Container(height: 2,
  width: 300,
  color: Colors.grey,),

 SizedBox(height: 10,),


  Column(children: [

    Center(child: 
      Text('${showtimeday1??''} ${showtimeno??''},${showtimemonth}')
    ),
    SizedBox(height: 10,),
Center(
   
    child:
      

    TextButton(onPressed: () {
      Navigator.push(context,MaterialPageRoute(builder:(context) =>
        book( movieDetails:{
          ...widget.movieDetails,
         'selectedShowtime': showtime,
            'selectedShowtimeDay': showtimeday1,
            'selectedShowtimeMonth': showtimemonth,
            'selectedShowtimeNo': showtimeno,
            'selectedHall': Hall,
            'selectedCinema': cinema1,})
      ) );
    },
     style: TextButton.styleFrom(
 // backgroundColor:  Color.transparent,
   // padding: EdgeInsets.symmetric(horizontal:.5, vertical: 1), // Padding inside the button
   shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10), // Button border radius
     ),
   ),
     child:   Container(
        height: 30,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),border: Border.all(width: 1),
        ),
        child: Center(child: 
         
          Text(showtime,style:TextStyle( color:Colors.black))
        ),
      ),),
       
     
    
  ),
  ],),
  SizedBox(height: 20,),
  Text(cinema2??''),
Container(height: 2,
  width: 300,
  color: Colors.grey,),
 SizedBox(height: 10,),
  Column(children: [

    Center(child: 
      Text('${showtimeday2??''} ${showtimeno2??''},${showtimemonth2}')
    ),
    SizedBox(height: 10,),
Center(
   
    child: 
      
     // SizedBox(width: 10),
    TextButton(onPressed: () {
      Navigator.push(context,MaterialPageRoute(builder:(context) =>
        book( movieDetails:{
          ...widget.movieDetails,
         'selectedShowtime': showtime2,
            'selectedShowtimeDay': showtimeday2,
            'selectedShowtimeMonth': showtimemonth2,
            'selectedShowtimeNo': showtimeno2,
            'selectedHall': Hall2,
            'selectedCinema': cinema2})
      ) );
    },
     style: TextButton.styleFrom(
//  backgroundColor: isDarkMode ? Colors.white : Colors.black,
    // padding: EdgeInsets.symmetric(horizontal: .5, vertical: 3), // Padding inside the button
   shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10), // Button border radius
     ),
   ),
     child:   Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),border: Border.all(width: 1),
        ),
        child: Center(child: 
         
          Text(showtime2,style:TextStyle( color:Colors.black))
        ),
      ),),
       
     
    
  ),
  ],),
  SizedBox(height: 20,),  

  ])  
 ],
        ),
      
      ),
    );
  }
}











 