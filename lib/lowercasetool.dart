import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateMoviesPage extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Function to update all movies with lowercase titles
  Future<void> updateMoviesWithLowercaseTitle() async {
    final QuerySnapshot moviesSnapshot = await firestore.collection('movies').get();

    for (var doc in moviesSnapshot.docs) {
      await doc.reference.update({
        'lowercase_title': (doc.data() as Map<String, dynamic>)['title'].toLowerCase(),
      });
    }

    print("All movies updated with lowercase_title field.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Movies with Lowercase Title'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await updateMoviesWithLowercaseTitle();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Movies updated successfully!')),
            );
          },
          child: Text('Run Update'),
        ),
      ),
    );
  }
}
