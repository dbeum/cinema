import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema/movie.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class tickets extends StatefulWidget {

 
  const tickets({super.key});

  @override
  State<tickets> createState() => _ticketsState();
}

class _ticketsState extends State<tickets> {
 

   final List<String> titles = ["A Quiet Place Day One", "Move Like A Boss", "Inspector Sun"];
  final List<Widget> images = [
      Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: AssetImage('assets/images/quiet.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Align(
     alignment: Alignment.topCenter,
        child:
        Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: 
          Text('Silverbird Cinema, Ikeja'),
        )
      
      )
    ),
    Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: AssetImage('assets/images/boss.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Align(
     alignment: Alignment.topCenter,
        child:
        Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: 
          Text('Silverbird Cinema, Ikeja'),
        )
      
      ),
    ),
    Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: AssetImage('assets/images/sun.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Align(
     alignment: Alignment.topCenter,
        child:
        Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: 
          Text('Silverbird Cinema, Ikeja'),
        )
      
      ),
    ),
  ];
int? selectedIndex;
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
      
      body: Stack(
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
                    Text('Silverbird Cinema, Ikeja', style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('February 15th',style: TextStyle(color:Colors.black),),
                    SizedBox(height: 5),
                    Text('Time: 9:40pm',style: TextStyle(color:Colors.black)),
                    SizedBox(height: 5),
                    Text('Row: 5',style: TextStyle(color:Colors.black)),
                    SizedBox(height: 5),
                    Text('Seat: 25',style: TextStyle(color:Colors.black)),
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
                  TextButton(onPressed: () {
  }, child: Icon(Icons.present_to_all_outlined,))
                    ],)
                  ],
                ),
              ),
            ),])
    );
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
           
          
          
          // Add more fields as needed
        );
      },
    ),
    ]
    )
    );
  }
}


