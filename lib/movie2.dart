import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema/authcheck.dart';
import 'package:cinema/hover.dart';
import 'package:cinema/info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Movie2 extends StatefulWidget {
  const Movie2({super.key});

  @override
  State<Movie2> createState() => _Movie2State();
}

class _Movie2State extends State<Movie2> {
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

 
Future<void> signOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // Optionally, navigate the user to the login screen after signing out
    Navigator.of(context).pushReplacementNamed('/login');
  } catch (e) {
    print("Error signing out: $e");
    // Handle sign-out error, show a message to the user if necessary
  }
}
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
       TextButton(onPressed: () { signOut(context);},
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
              style: GoogleFonts.montserrat(textStyle:TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
              
               
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
                      height: 500.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1,
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
                                width: 1000,
                                height: 270,
                              )
                            : Image.asset(
                                'assets/images/logo.png',  // Use a local placeholder image
                                fit: BoxFit.cover,
                                width: 1000,
                                height: 270,
                              ),
            ));
                  },
          
        ));}),
            Container(
                  margin: EdgeInsets.only(top: 550),
                  child: 
          Column(
            children: [
            Text('Movies',style: GoogleFonts.poppins(textStyle:TextStyle( fontWeight: FontWeight.normal),)) ,
       //     SizedBox(height: 5,),
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
                  margin: EdgeInsets.only(top: 900),
                  child: 
          Column(
            children: [
            Text('Coming Soon',style: GoogleFonts.inconsolata(textStyle:TextStyle( fontWeight: FontWeight.normal),)) ,
           // SizedBox(height: 5,),
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
     
    )  ) 
    );
  }
}