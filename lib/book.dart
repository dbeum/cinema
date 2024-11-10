
import 'package:cinema/home.dart';
import 'package:cinema/info.dart';
import 'package:cinema/movie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class book extends StatefulWidget {
   final Map<String, dynamic> movieDetails;
 
    book({
    required this.movieDetails
   
  });

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> {
  int _ticketCount = 1;
    String randomString = '';


    final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

void initState() {
    super.initState();
    randomString = generateRandomString(10); // Call the function here
  }

  void _incrementTicket() {
    setState(() {
      _ticketCount++;
    });
  }

   void _decrementTicket() {
    if (_ticketCount > 1) { // Prevent the count from going below 1
      setState(() {
        _ticketCount--;
      });
    }
  }
 String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}



   



  @override
  Widget build(BuildContext context) {
     String? title = widget.movieDetails['title'];
 String? posterUrl = widget.movieDetails['poster_url'];
  String? selectedShowtime = widget.movieDetails['selectedShowtime'];
    String? selectedShowtimeDay = widget.movieDetails['selectedShowtimeDay'];
    String? selectedShowtimeMonth = widget.movieDetails['selectedShowtimeMonth'];
    String? selectedShowtimeNo = widget.movieDetails['selectedShowtimeNo'];
    String? selectedHall = widget.movieDetails['selectedHall'];
     String? selectedCinema = widget.movieDetails['selectedCinema'];

String? price = widget.movieDetails['price'];


    return Scaffold(
      body: Stack(
        children: [
           Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: posterUrl != null
                    ? NetworkImage(posterUrl) // Use the movie poster as background
                    : AssetImage('images/placeholder.png') as ImageProvider, // Fallback placeholder image
                fit: BoxFit.cover, // Cover the entire screen
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Optional: Add dark overlay
                  BlendMode.darken, // Blend mode for the overlay
                ),
              ),
            ),
          ),
           Column(
        children: [
         Center(child: 
         Image.asset('assets/images/logo.png'),) ,
         Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: [
 Row(
  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    SizedBox(width: 5,),
      Container(
       height: 100,width: 70,
       margin: EdgeInsets.only(top:5),
       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),),
       child: ClipRRect(
   borderRadius: BorderRadius.circular(15.0), // Adjust the value for more or less rounding
   child:  posterUrl != null
                ? Image.network(
      posterUrl,
     fit: BoxFit.fill,
   ) : Image.asset('images/placeholder.png'),
 )),
 SizedBox(width: 5,),
 Text(
                  title ?? 'No Title Available',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ensure the text is visible on dark background
                  ),
                ),
  ],
 ),

 Text(selectedCinema??'',style: TextStyle(color: Colors.black),),
 Row(children: [
  SizedBox(width: 5,),
  Text('Screen: ',style: TextStyle(color: Colors.black)),
  Text(selectedHall ??'',style: TextStyle(color: Colors.black)),
  

 ],),
 Row(children: [
  SizedBox(width: 5,),
  Text('Ticket Number: ',style: TextStyle(color: Colors.black)),
 
  Text( randomString,style: TextStyle(color: Colors.black))

 ],),
  Text('${selectedShowtimeDay??''} ${selectedShowtimeNo??''},${selectedShowtimeMonth??''}',style: TextStyle(color: Colors.black),),
 Row(children: [
  SizedBox(width: 5,),
  Text('Time: ',style: TextStyle(color: Colors.black)),
  Text(selectedShowtime??'',style: TextStyle(color: Colors.black))
 ],),
 SizedBox(height: 10,),
 Text('Select Tickets',style: TextStyle(color: Colors.black,fontSize: 20)),
 Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Decrement button
        Text('Price: \$',style: TextStyle(fontSize: 15,color: Colors.black),),
Text(price??'',style: TextStyle(color: Colors.black,fontSize: 15),),
SizedBox(width: 50,),
        IconButton(
          onPressed: _decrementTicket,
          icon: Icon(Icons.remove, color: Colors.red),
        ),
        
        // Display the number of tickets
        Text(
          '$_ticketCount',
          style: TextStyle(fontSize: 24,color: Colors.black),
        ),
        
        // Increment button
        IconButton(
          onPressed: _incrementTicket,
          icon: Icon(Icons.add, color: Colors.green),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Text('Booking Fee: ',style: TextStyle(fontSize: 20,color: Colors.black),),
      Text('\$${_ticketCount * int.parse(price ?? '0')}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black))
    ],),
    SizedBox(height: 10,),
    Center(
      child: ElevatedButton(onPressed:() {
         int totalAmount = _ticketCount * int.parse(price ?? '0');
       Navigator.push(context, MaterialPageRoute(builder: (context) => payment(totalAmount:totalAmount,movieDetails: widget.movieDetails,ticketCount:_ticketCount,ticketno:randomString)));
      } , child: Text('BOOK',style: TextStyle(color: Color.fromARGB(255, 133, 133, 133)),)),
    )
            ],
          ),
         ),

        ],
      ),
          
        
        ],
      ),
    );
  }
}

 
class payment extends StatefulWidget {
  final Map<String, dynamic> movieDetails;
  final int totalAmount;
final int ticketCount;
final String ticketno;

  const payment({super.key,
  required this.totalAmount,
  required this.movieDetails,
  required this.ticketCount,
   required this.ticketno
  });

  @override
  State<payment> createState() => _paymentState();
}

    final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


class _paymentState extends State<payment> {
  final RegExp _mmYearRegex = RegExp(r'^(0[1-9]|1[0-2])\/\d{4}$');

  
Future<void> _saveBookingToFirebase() async {
    User? user = _auth.currentUser; // Get the current user

    if (user != null) {
      String userId = user.uid; // Get user's unique ID

      try {
        await _firestore.collection('bookings').add({
          'userId': userId,
          'movieTitle': widget.movieDetails['title'],
          'selectedShowtime': widget.movieDetails['selectedShowtime'],
          'selectedShowtimeDay': widget.movieDetails['selectedShowtimeDay'],
          'selectedShowtimeMonth': widget.movieDetails['selectedShowtimeMonth'],
          'selectedShowtimeNo': widget.movieDetails['selectedShowtimeNo'],
          'selectedHall': widget.movieDetails['selectedHall'],
          'selectedCinema': widget.movieDetails['selectedCinema'],
          'ticketCount': widget.ticketCount,
          'totalAmount': widget.ticketCount *  int.parse(widget.movieDetails['price']),
          'bookingDate': Timestamp.now(), // Timestamp for when the booking was made
           'poster_url': widget.movieDetails['poster_url'],
           'ticketno':widget.ticketno
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Booking successful!'),
          
        ));
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to book: $e'),
        ));
      }
    } else {
      // Show a message if the user is not logged in
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You must be logged in to book tickets'),
      ));
    }
  }
    
Future<void> _saveHistoryToFirebase() async {
    User? user = _auth.currentUser; // Get the current user

    if (user != null) {
      String userId = user.uid; // Get user's unique ID

      try {
        await _firestore.collection('history').add({
          'userId': userId,
          'movieTitle': widget.movieDetails['title'],
          'selectedShowtime': widget.movieDetails['selectedShowtime'],
          'selectedShowtimeDay': widget.movieDetails['selectedShowtimeDay'],
          'selectedShowtimeMonth': widget.movieDetails['selectedShowtimeMonth'],
          'selectedShowtimeNo': widget.movieDetails['selectedShowtimeNo'],
          'selectedHall': widget.movieDetails['selectedHall'],
          'selectedCinema': widget.movieDetails['selectedCinema'],
          'ticketCount': widget.ticketCount,
          'totalAmount': widget.ticketCount *  int.parse(widget.movieDetails['price']),
          'bookingDate': Timestamp.now(), // Timestamp for when the booking was made
           'poster_url': widget.movieDetails['poster_url'],
           'ticketno':widget.ticketno
        });

        // Show success message
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Booking successful!'),
          
        // ));
     //   Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        // Show error message
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Failed to book: $e'),
        // ));
      }
    } else {
      // Show a message if the user is not logged in
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('You must be logged in to book tickets'),
      // ));
    }
  }
  Future<void> _saveBookingAndHistory() async {
  await _saveBookingToFirebase();
  await _saveHistoryToFirebase();
}
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
        width: 100,
        child: Image.asset('assets/images/payu.png',height: 30,)
        ),
        ],
      )
      ),
      body: SingleChildScrollView(
        child: Column(
          
children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  Text('Amount Due:'),
  Text('\$${widget.totalAmount}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
],),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
  Text('Ticket Number:'),
  Text('${widget.ticketno}')
],),
SizedBox(height: 20,),
Container(
  height: 520,
  width: 400,
 decoration: BoxDecoration( color: const Color.fromARGB(255, 211, 207, 207),
 borderRadius:BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
 ),
 
  child: Column(
children: [
   SizedBox(height: 10,),
  Container(
    child: Row(
    children: [
     
      SizedBox(width: 10,),
      Text('Card Payment',style: TextStyle(fontSize: 20,color: Colors.black),),
      SizedBox(width: 2,),
      Container(
        width: 3,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.black
        ),
      ),
      SizedBox(width: 20),
      Image.asset('assets/images/master.png',height: 30,),
      Image.asset('assets/images/visa.png',height: 30,)
    ],
  ),
  ),
  SizedBox(height: 10,),
  Container(
    height: 470,
    width: 380,
    decoration: BoxDecoration(color: Colors.white,
   // borderRadius:BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
    ),
    child: Column(
     // alignment: Alignment.center,
      children: [
        Padding(padding: EdgeInsets.all(10),
        child: 
        Text('We accept major credit cards including VISA and MasterCard.The accepted payment options are provided above.',style: TextStyle(color: Colors.black),),),
        SizedBox(height: 5,),
       Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(width: 30,),
         Text('Card number',style: TextStyle(color: Colors.black),)
       ],),
Row(children: [
  SizedBox(width: 20,),
  Container(height: 40,
width: 320,
decoration: BoxDecoration(border: Border.all(width: 1),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5))),
child: TextField(
 keyboardType: TextInputType.number,
  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  ),
),
Container(
  height: 40,
  width: 10,
  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),color:Color.fromARGB(255, 167, 196, 1),border: Border.all(width: 1)),
)
],),
SizedBox(height: 10,),
  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(width: 30,),
         Text('Card holder name',style: TextStyle(color: Colors.black),)
       ],),
Row(children: [
  SizedBox(width: 20,),
  Container(height: 40,
width: 320,
decoration: BoxDecoration(border: Border.all(width: 1),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5))),
child: TextField(
  
  //decoration: InputDecoration()
  ),
),
Container(
  height: 40,
  width: 10,
  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),color: Color.fromARGB(255, 167, 196, 1),border: Border.all(width: 1)),
)
],),
SizedBox(height: 10,),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Container(
      margin: EdgeInsets.only(right: 25),
      child: Text('Expiry Date',style: TextStyle(color: Colors.black),),
    )
  ],
),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  //SizedBox(width: 10,),
  Row(children: [
    Container(
    height: 40,
    width: 100,
    decoration: BoxDecoration(border: Border.all(width: 1),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5))),
    child: TextField(
      keyboardType: TextInputType.number,
  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(hintText: ' CVV',hintStyle: TextStyle(color: Colors.grey)) 
   
    ),
  ),
  Container(
  height: 40,
  width: 10,
  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),color:Color.fromARGB(255, 167, 196, 1),border: Border.all(width: 1)),
)
  ],),
SizedBox(width: 20,),
 Row(children: [Container(
    height: 40,
    width: 100,
    decoration: BoxDecoration(border: Border.all(width: 1),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5))),
    child: TextField(
      keyboardType: TextInputType.number,
  inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')), // Allow only numbers and "/"
            LengthLimitingTextInputFormatter(7), // Limit to mm/year format (e.g., 10/2023)
          ],
    decoration: InputDecoration(hintText: ' MM/YY',hintStyle: TextStyle(color: Colors.grey)) ,
    
    ),
  ),
  Container(
  height: 40,
  width: 10,
  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),color: Color.fromARGB(255, 167, 196, 1),border: Border.all(width: 1)),
),],)
],),
SizedBox(height: 10,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
ElevatedButton(onPressed:_saveBookingAndHistory,
style: ButtonStyle(backgroundColor:MaterialStatePropertyAll( const Color.fromARGB(255, 167, 196, 1))),
 child: Text('Pay \$${widget.totalAmount}',style: TextStyle(color: Colors.black),)),

],),
SizedBox(height: 10,),
Padding(
 padding: EdgeInsets.all(10),
  child: Text('*You may be redirected to your bank\'s secure site to authenticate yourself before making the payment'),
)



      ],
    ),
  )
],
  ),
)
],
        ),
      ),
    );
  }
}