import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema/authcheck.dart';
import 'package:cinema/hover2.dart';
import 'package:cinema/info.dart';
import 'package:cinema/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  
   // bool _isExpanded = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchMovies() async {
    // Fetch all movie documents
    QuerySnapshot snapshot = await _firestore.collection('movies').get();

    // Convert documents to a list of maps, including the document ID (movie name)
    return snapshot.docs.map((doc) {
      return {
        'id': doc.id,  // The movie name (Alien, for example)
        ...doc.data() as Map<String, dynamic> // The rest of the movie details
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> fetchavailable() async {
    // Fetch all movie documents
    QuerySnapshot snapshot = await _firestore.collection('available').get();

    // Convert documents to a list of maps, including the document ID (movie name)
    return snapshot.docs.map((doc) {
      return {
        'id': doc.id,  // The movie name (Alien, for example)
        ...doc.data() as Map<String, dynamic> // The rest of the movie details
      };
    }).toList();
  }
  Future<List<Map<String, dynamic>>> fetchcoming() async {
    // Fetch all movie documents
    QuerySnapshot snapshot = await _firestore.collection('coming').get();

    // Convert documents to a list of maps, including the document ID (movie name)
    return snapshot.docs.map((doc) {
      return {
        'id': doc.id,  // The movie name (Alien, for example)
        ...doc.data() as Map<String, dynamic> // The rest of the movie details
      };
    }).toList();
  }
    final FirebaseAuth auth = FirebaseAuth.instance;
void signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => login()), // Navigate to login screen after sign out
  );
}

 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body:
          
      

           SingleChildScrollView(
      child: 
      Stack(
      children: [
       
        Container(
          width: 30,
          height: 30,
          // margin: EdgeInsets.only(left: 30,top: 20),
          alignment: Alignment.topCenter,
          child: 
        TextButton(onPressed: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => info(),)),
        style: ButtonStyle(
     overlayColor: MaterialStateProperty.all(Colors.transparent), 
  
  ),
  
        child: Icon(Icons.logout_rounded,color: Colors.blueAccent,),)
    ),
    SizedBox(height: 20,),
       Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0), // Adjust top padding as needed
            child: Text(
              'Now Available', // Use Unicode for the degree symbol
              style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
            ),
          ),
        ),
    FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchavailable(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error fetching movies'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No movies found'));
              }

              List<Map<String, dynamic>> available = snapshot.data!;

              return Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 270.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                      itemCount: available.length,
                  itemBuilder: (context, index, realIndex) {
                    var availables = available[index];

                    // Fetch 'poster_url' from the nested document data
                    String? posterUrl = availables['poster_url'] ; // Adjust field name to match your database

                    return Container(
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
              child:  posterUrl != null
                            ? Image.network(
                                posterUrl,
                                fit: BoxFit.cover,
                                width: 400,
                                height: 270,
                              )
                            : Image.asset(
                                'assets/images/logo.png',  // Use a local placeholder image
                                fit: BoxFit.cover,
                                width: 400,
                                height: 270,
                              ),
            ));
                  },
          
        )
        );}
        ),
                Container(
                  margin: EdgeInsets.only(top: 330),
                  child: 
          Column(
            children: [
            Text('Movies',style: GoogleFonts.poppins(textStyle:TextStyle( fontWeight: FontWeight.normal),)) ,
            SizedBox(height: 5,),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error fetching movies'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No movies found'));
              }

              List<Map<String, dynamic>> movies = snapshot.data!;

              return 
           Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: false,
                     initialPage: 1,
                      enlargeCenterPage: false,
                      aspectRatio: 4/3,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: .45,
                    ),
                             itemCount: movies.length,
                  itemBuilder: (context, index, realIndex) {
                    var movie = movies[index];

                    // Fetch 'poster_url' from the nested document data
                    String? posterUrl = movie['poster_url'] ; // Adjust field name to match your database

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child:TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => info(),)),
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: posterUrl != null
                            ? Image.network(
                                posterUrl,
                                fit: BoxFit.cover,
                                width: 200,
                                height: 250,
                              )
                            : Image.asset(
                                'assets/images/logo.png',  // Use a local placeholder image
                                fit: BoxFit.cover,
                                width: 200,
                                height: 250,
                              ),
                      ) )
                    );
                  },

                ),
              );
            },
          ),
        ],
      ),
                ),
           Container(
                  margin: EdgeInsets.only(top: 600),
                  child: 
          Column(
            children: [
            Text('Coming Soon',style: GoogleFonts.inconsolata(textStyle:TextStyle( fontWeight: FontWeight.normal),)) ,
            SizedBox(height: 5,),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchcoming(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error fetching movies'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No movies found'));
              }

              List<Map<String, dynamic>> coming = snapshot.data!;

              return 
           Align(
          alignment: Alignment.topCenter,
        
             child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: false,
                     initialPage: 1,
                      enlargeCenterPage: false,
                      aspectRatio: 4/3,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: .45,
                    ),
                             itemCount: coming.length,
                  itemBuilder: (context, index, realIndex) {
                    var comings = coming[index];

                    // Fetch 'poster_url' from the nested document data
                    String? posterUrl = comings['poster_url'] ; // Adjust field name to match your database

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child:TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => info(),)),
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: posterUrl != null
                            ? Image.network(
                                posterUrl,
                                fit: BoxFit.cover,
                                width: 200,
                                height: 250,
                              )
                            : Image.asset(
                                'assets/images/logo.png',  // Use a local placeholder image
                                fit: BoxFit.cover,
                                width: 200,
                                height: 250,
                              ),
                      ) )
                    );
                  },

                ),
              );
            },
          ),
        ],
      ),
                ),       
      ],
      
    )
           )    ,   
  
          
  drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(height: 70),
              
              ListTile(
                onTap: () {
                        signOut(context);
                },
                leading: Icon(Icons.logout,color: Colors.red,),
                title: Text('Log out',style:GoogleFonts.signika(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
        //DRAWER ENDS
  );
          
}
  
    
  }



//     Container(
//         margin: EdgeInsets.only(top: 1330),
//         child: 
//  Column(
//   children: [
//  Text('Coming Soon',  style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.normal)))  ,
//            Align(
//           alignment: Alignment.topCenter,
        
//              child: CarouselSlider(
//                     options: CarouselOptions(
//                       height: 200.0,
//                       autoPlay: false,
//                      initialPage: 1,
//                       enlargeCenterPage: false,
//                       aspectRatio: 4/3,
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enableInfiniteScroll: false,
//                       autoPlayAnimationDuration: Duration(milliseconds: 800),
//                       viewportFraction: .5,
//                     ),
//             items:[
//    Hover2ExpandImage(
//               imagePath: 'images/wild1.jpg',
//               width: 200,
//               height: 250,
//               text: 'The Wild Robot',
//               text2: 'PG',
//                imagePath2: 'images/rate.png',
//                 text3: '',
//             ),
//        Hover2ExpandImage(
//               imagePath: 'images/afraid1.jpg',
//               width: 200,
//               height: 250,
//               text: 'Afraid',
//               text2: '18',
//                imagePath2: 'images/rate.png',
//                 text3: '',
//             ),
//        ],
//         ),)
//   ],
//  ),
//  ),