import 'package:cinema/home.dart';
import 'package:cinema/videoplayer.dart';
import 'package:cinema/youtubeplayer.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';


class info2 extends StatefulWidget {
 final Map<String, dynamic> comingDetails;
 

  info2({
    required this.comingDetails
   
  });
 

  @override
  State<info2> createState() => _info2State();
}

class _info2State extends State<info2> {
   

  @override
  Widget build(BuildContext context) { 
   String? title = widget.comingDetails['title'];
    String? posterUrl = widget.comingDetails['poster_url'];
    String? description = widget.comingDetails['description'];
    String? actor1 = widget.comingDetails['Actor 1'];
    String? actor2 = widget.comingDetails['Actor 2'];
    String? actor3 = widget.comingDetails['Actor 3'];
    String? date = widget.comingDetails['Date'];
    String? language = widget.comingDetails['Language']??'';
    //String? time = widget.movieDetails['Time'];
    String? genre = widget.comingDetails['genre'];
    String? posterUrl1 = widget.comingDetails['poster1_url'];
    //String? rating = widget.movieDetails['rating'];
    String? director = widget.comingDetails['Director'];
   // String? rating1 = widget.movieDetails['rating1'];
    String? yurl = widget.comingDetails['yurl'];








       return Theme(
      data: Theme.of(context).copyWith(
      
      ),
       child:  ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileNavBar(posterUrl,actor1,actor2,actor3,date,language,title,genre,posterUrl1,description,yurl,director),
      desktop: (BuildContext context) => DeskTopNavBar(posterUrl,actor1,actor2,actor3,date,language,title,genre,posterUrl1,description,yurl,director),
       ));
  }


  Widget MobileNavBar(String? posterUrl,actor1,actor2,actor3,date,language,genre,title,posterUrl1,description,yurl,director) {
    return   Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,),
     body: SingleChildScrollView(
        child: 
        Stack(
children: [

    
  
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
    //    Text('Rating: '+ rating +' • '+ rating1,style: TextStyle(fontSize: 10),),
      // Text(time,style: TextStyle(fontSize: 10),),
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
 //Text('Silverbird Cinema,Ikeja')
  ],),
 ),
 SizedBox(height: 10,),


  ])  
 ],
        ),
      
      ),
    );
  }

  Widget DeskTopNavBar(String? posterUrl,actor1,actor2,actor3,date,language,genre,title,posterUrl1,description,yurl,director) {
    return   Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
     body: SingleChildScrollView(
        child: 
        Stack(
children: [

    
  
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
    //    Text('Rating: '+ rating +' • '+ rating1,style: TextStyle(fontSize: 10),),
      // Text(time,style: TextStyle(fontSize: 10),),
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
 //Text('Silverbird Cinema,Ikeja')
  ],),
 ),
 SizedBox(height: 10,),


  ])  
 ],
        ),
      
      ),
    );
  }
}












 