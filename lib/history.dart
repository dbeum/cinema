import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TicketHistoryPage extends StatefulWidget {
  const TicketHistoryPage({Key? key}) : super(key: key);

  @override
  State<TicketHistoryPage> createState() => _TicketHistoryPageState();
}

class _TicketHistoryPageState extends State<TicketHistoryPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchTicketHistory() async {
  
      QuerySnapshot snapshot = await _firestore.collection('history').get();
print("Fetched ${snapshot.docs.length} bookings.");
    // Convert documents to a list of maps, including the document ID (movie name)
    return snapshot.docs.map((doc) {
      return {
        'id': doc.id,  // The movie name (Alien, for example)
        ...doc.data() as Map<String, dynamic> // The rest of the movie details
      };
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket History'),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchTicketHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading ticket history.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tickets found.'));
          }

          final tickets = snapshot.data!;

          return ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Icon(Icons.movie),
                  title: Text(ticket['movieTitle'] ?? 'Unknown Movie'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ticket Number: ${ticket['ticketno']}'),
                      Text('Number of Ticket: ${ticket['ticketCount']}'),
                     Text('Time: ${ticket['showtime']} - ${ticket['showtimeNo']},${ticket['showtimeDay']},${ticket['showtimeMonth']}'),
                      Text('Hall: ${ticket['hall']}'),
                      if (ticket['status'] != null)
                        Text('Status: ${ticket['status']}'),
                    ],
                  ),
                //  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Optional: Navigate to ticket detail page or show more info
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
