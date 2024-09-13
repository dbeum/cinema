import 'dart:convert';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema/movie.dart';
import 'package:cinema/movie2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cinema/cinema.dart';




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  int _selectedIndex = 0;
  final NotchBottomBarController _controller = NotchBottomBarController();
  final PageController _pageController = PageController();

  
  static List<Widget> _widgetOptions = <Widget>[
   //mobile
    Movie(),
   cinema(),
    //TicketsScreen(),
  ];
  
 static List<Widget> _widgetOptions2 = <Widget>[
    //desktop
    Movie2(),
   cinema(),
    //TicketsScreen(),
  ];

  final TextStyle selectedLabelStyle = TextStyle(
  fontFamily: 'Montserrat', 
  fontSize: 14,
  fontWeight: FontWeight.bold,
  
);

final TextStyle unselectedLabelStyle = TextStyle(
  fontFamily: 'Montserrat',  
  fontSize: 14,
  fontWeight: FontWeight.normal,

);


void _onItemTapped(int index) {
    setState(() {
       _pageController.jumpToPage(index);
      _selectedIndex = index;
    });
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
      //  pageController: _pageController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.movie, color: Colors.blueGrey),
            activeItem: Icon(Icons.movie, color: Colors.blueAccent),
            itemLabel: 'Movies',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.location_city, color: Colors.blueGrey),
            activeItem: Icon(Icons.location_city, color: Colors.blueAccent),
            itemLabel: 'Cinema',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.confirmation_number, color: Colors.blueGrey),
            activeItem: Icon(Icons.confirmation_number, color: Colors.blueAccent),
            itemLabel: 'Tickets',
          ),
        ],
        onTap: _onItemTapped,
      //  selectedIndex: _selectedIndex,
        bottomBarWidth: 400.0,
        bottomBarHeight: 50.0,
        notchColor: Colors.blue,
        durationInMilliSeconds: 400,
        showLabel: true,
        itemLabelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
        notchGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.white],
        ),
        elevation: 2.0,
        removeMargins: false,
        showTopRadius: true,
        showBottomRadius: false, kIconSize: 20, kBottomRadius: 15,
        
      ),
    );
  }

  Widget DeskTopNavBar() {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions2,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
       // pageController: _pageController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.movie, color: Colors.blueGrey),
            activeItem: Icon(Icons.movie, color: Colors.blueAccent),
            itemLabel: 'Movies',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.location_city, color: Colors.blueGrey),
            activeItem: Icon(Icons.location_city, color: Colors.blueAccent),
            itemLabel: 'Cinema',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.confirmation_number, color: Colors.blueGrey),
            activeItem: Icon(Icons.confirmation_number, color: Colors.blueAccent),
            itemLabel: 'Tickets',
          ),
        ],
        onTap: _onItemTapped,
       // selectedIndex: _selectedIndex,
        bottomBarWidth: 1000.0,
        bottomBarHeight: 50.0,
        notchColor: Colors.blue,
        durationInMilliSeconds: 300,
        showLabel: true,
        itemLabelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
        notchGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.white],
        ),
        elevation: 2.0,
        removeMargins: false,
        showTopRadius: true,
        showBottomRadius: false, kIconSize: 15, kBottomRadius: 15,
      ),
    );
  }
}










//design bottom navbar
//cinema page
//tickets page
//each movies click-rent a movie or buy ticket plus movie info
//rent a movie page 

//dark mode
//login page
//firebase link
//profile page
//animated container render overflow issue
//transition animation
// tutorial screen on first launch
//learn shared preference