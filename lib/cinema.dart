import 'package:cinema/info.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cinema extends StatefulWidget {
  @override
  _CinemaState createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> {
  final TextEditingController _searchController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _searchResults = [];

  // Function to search for movies with a case-insensitive query
  Future<void> _searchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    try {
      // Convert query to lowercase for case-insensitive search
      String lowerCaseQuery = query.toLowerCase();

      QuerySnapshot snapshot = await _firestore
          .collection('movies')
          .where('lowercase_title', isGreaterThanOrEqualTo: lowerCaseQuery)
          .where('lowercase_title', isLessThanOrEqualTo: lowerCaseQuery + '\uf8ff')
          .get();

      setState(() {
        _searchResults = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      print("Error searching movies: $e");
    }
  }

  @override
  void initState() {
    super.initState();

    // Listener to fetch movies on each keystroke
    _searchController.addListener(() {
      _searchMovies(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          
        child: Container(width: 300,
        height: 50,
        margin: EdgeInsets.only(top: 5),
      //  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15),),border: Border.all(width: 1,color: Colors.black)),
        child: TextField(
          controller: _searchController,
          style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black, // Adapts text color
        ),
          decoration: InputDecoration(
            hintText: 'Search Movies...',
            
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _searchResults = [];
                });
              },
            ),
          ),
        ),
        )),
        backgroundColor: Colors.transparent,
      ),
      body: _searchResults.isEmpty
          ? Center(child: Text('No movies found'))
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                var movie = _searchResults[index];
                return ListTile(
                  leading: movie['poster_url'] != null
                      ? Image.network(movie['poster_url'], width: 50)
                      : null,
                  title: Text(movie['title'] ?? 'No Title'),
                  subtitle: Text('Rating: ${movie['rating'] ?? 'N/A'} • ${movie['rating1'] ?? 'N/A'} '),
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => info( movieDetails: movie,),));
                  },
                );
              },
            ),
    );
  }
}