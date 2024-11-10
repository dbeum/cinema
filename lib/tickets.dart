import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema/movie.dart';
import 'package:cinema/pdf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

class tickets extends StatefulWidget {

 
  const tickets({super.key});

  @override
  State<tickets> createState() => _ticketsState();
}

class _ticketsState extends State<tickets> {
 
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 late Future<List<Map<String, dynamic>>> futureBookings; // Define the future here

  @override
  void initState() {
    super.initState();
    futureBookings = fetchbookings(); // Initialize it in initState
  } 
  
  Future<List<Map<String, dynamic>>> fetchbookings() async {
    // Fetch all movie documents
    QuerySnapshot snapshot = await _firestore.collection('bookings').get();
print("Fetched ${snapshot.docs.length} bookings.");
    // Convert documents to a list of maps, including the document ID (movie name)
    return snapshot.docs.map((doc) {
      return {
        'id': doc.id,  // The movie name (Alien, for example)
        ...doc.data() as Map<String, dynamic> // The rest of the movie details
      };
    }).toList();
  }
  
    

int? selectedIndex;


Future<void> generateReport(String title,Map<String, dynamic> data) async {
  final pdf = pw.Document();
 final imageBytes = await rootBundle.load('assets/images/logo.png'); // Adjust the path as needed
  final posterImage = pw.MemoryImage(imageBytes.buffer.asUint8List());
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Padding(
          padding: pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
                           pw.Image(posterImage, height: 150, width: 100),
              pw.SizedBox(height: 20),
              pw.Text(
                title,
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
              pw.Divider(height: 20, thickness: 2),

                pw.SizedBox(height: 10),
                pw.Text('Ticket Summary', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Text('Ticket Number: ${data['ticketno']}'),
                pw.Text('Date: ${data['selectedShowtimeDay']} ${data['selectedShowtimeNo']}, ${data['selectedShowtimeMonth']}'),
                pw.Text('Time: ${data['selectedShowtime']}'),
                 pw.SizedBox(height: 20),
                pw.Text('${data['selectedCinema']}', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 20),
                pw.Text('Hall: ${data['selectedHall']}', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 20),
              pw.Text('Notes', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.Text('This report provides an overview of the selected movie ticket details, including showtime, hall information, and other relevant booking specifics.'),

            ],
          ),
        );
      },
    ),
  );

  await Printing.sharePdf(bytes: await pdf.save(), filename: 'leave_analytics_report.pdf');
}
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
      
      body: FutureBuilder<List<Map<String, dynamic>>>(
            future: futureBookings,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                 print("Error: ${snapshot.error}");
                return Center(child: Text('Error fetching movies'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No tickets found'));
              }

          List<String> titles = snapshot.data!
              .map((bookings) => bookings['movieTitle'] as String)
              .toList();
          List<Widget> images = snapshot.data!.map((bookings) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(bookings['poster_url']), // Replace with dynamic image if available
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(bookings['selectedCinema'] ?? 'Cinema Hall'),
                ),
              ),
            );
          }).toList();

      return Stack(
        children: [
          VerticalCardPager(
            titles: titles,
            images: images,
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            onPageChanged: (pageIndex) {
              setState(() {
                if (pageIndex != null) {
                  selectedIndex = pageIndex.toInt(); // Convert double to int
                }
              });
            },
            onSelectedItem: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          if (selectedIndex != null) // Display detailed content if an item is selected
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(

                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(titles[selectedIndex!], style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                    Text('Ticket Number: ${snapshot.data![selectedIndex!]['ticketno']}',style: TextStyle(color:Colors.black),),
                    SizedBox(height: 10),
                    Text('Date: ${snapshot.data![selectedIndex!]['selectedShowtimeDay']} ${snapshot.data![selectedIndex!]['selectedShowtimeNo']}, ${snapshot.data![selectedIndex!]['selectedShowtimeMonth']}',style: TextStyle(color:Colors.black),),

                    SizedBox(height: 5),
                    Text('Time: ${snapshot.data![selectedIndex!]['selectedShowtime']}',style: TextStyle(color:Colors.black)),
                     SizedBox(height: 5),
                    Text('${snapshot.data![selectedIndex!]['selectedCinema']}',style: TextStyle(color:Colors.black)),
                    SizedBox(height: 5),
                    Text('Hall: ${snapshot.data![selectedIndex!]['selectedHall']}',style: TextStyle(color:Colors.black)),
                    
                    SizedBox(height: 20),
                    Row(children: [
                      ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = null; // Deselect when the button is pressed
                        });
                      },
                      child: Text('Close Details'),
                    ),
                    SizedBox(width: 50,),
                  TextButton(onPressed: () async{
    await generateReport(titles[selectedIndex!], snapshot.data![selectedIndex!]);
  }, child: Icon(Icons.present_to_all_outlined,))
                    ],)
                  ],
                ),
              ),
            ),]);
  }
    ));
  }
  }

  Widget DeskTopNavBar() {
    return Scaffold(
       body: Stack(
       children:[ ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
       // final attendance = data[index];
        return ListTile(
          onTap: () {
           // Navigator.push(context, MaterialPageRoute(builder: (context) => Exp(attendanceData: attendance),));
          },
          title:Container(margin: EdgeInsets.only(top: 30),
          child:  Text('Ticket #${index + 1}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          subtitle: Container(
             decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/quiet.jpg'),
              fit: BoxFit.cover, // Adjust image to fill the container
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), // Add color overlay with transparency
                BlendMode.darken, // Change blend mode (you can experiment with others like `softLight`, `multiply`)
              ),
            ),
          ),
            //decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 1,color: Colors.black)),
            child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8), // Add some space between title and subtitles
            
                  SizedBox(width: 5), // Add space between clocked in and clocked out text
                  Image.asset('assets/images/quiet1.jpg',width: 200,),
                  SizedBox(width: 200), 
  Row(
                children: [
                 Column(
                  
                  children: [
                    SizedBox(height: 50,),
Text('A QUIET PLACE DAY ONE',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
SizedBox(height: 5),
Text('Silverbird Ikeja',style: TextStyle(color: Colors.black)),
SizedBox(height: 5,),
Text('Feburary 15',style: TextStyle(color: Colors.black)),
SizedBox(height: 10,),
ElevatedButton(onPressed: () {
}, style: ElevatedButton.styleFrom(
  
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside the button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Button border radius
    ),
  ),child: Text('7:00pm')),
SizedBox(height: 10,),
ElevatedButton(onPressed: () {
},style: ElevatedButton.styleFrom(
  
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside the button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Button border radius
    ),
  ), child: Text('ROW: '+'2')),
SizedBox(height: 10,),
ElevatedButton(onPressed: () {
},style: ElevatedButton.styleFrom(
  
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside the button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Button border radius
    ),
  ), child: Text('SEAT: '+'20')),
  SizedBox(height: 30,),
  TextButton(onPressed: () {
    
  }, child: Icon(Icons.present_to_all_outlined,))
                  ],
                 ),
                ],
              ),
            

              
            ],
            
          ),)
           
          
          
          
        );
      },
    ),
    ]
    )
    );
  }





