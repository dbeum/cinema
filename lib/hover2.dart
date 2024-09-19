import 'package:cinema/info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hover2ExpandImage extends StatefulWidget {
  final String imagePath;
final String imagePath2;
  final double width;
  final double height;
final String text;
final String text2;
final String text3;

  Hover2ExpandImage({
    required this.imagePath,
     required this.imagePath2,
    required this.width,
    required this.height,
    required this.text,
     required this.text2,
     required this.text3,
 
  });

  @override
  _Hover2ExpandImageState createState() => _Hover2ExpandImageState();
}

class _Hover2ExpandImageState extends State<Hover2ExpandImage> {
 // bool _isTapped = false;
    bool _isLongPressed = false;

  @override
  Widget build(BuildContext context) {
     return TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => info( 
    // imagePath: widget.imagePath,
    //                 text: widget.text,text2:widget.text2
                  ),)), child: 
    
      GestureDetector(
        // onTap: () {
        //   setState(() {
        //     _isTapped = !_isTapped; // Toggle the tapped state on each tap
        //   });
        // },
         onLongPress: () {
          setState(() {
            _isLongPressed = !_isLongPressed; // Toggle long press state
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Stack(
              children: [
                Image.asset(
                  widget.imagePath,
                  width: _isLongPressed ? widget.width * 1.2 : widget.width,
                  height: _isLongPressed ? widget.height * 1.2 : widget.height,
                  fit: BoxFit.cover,
                ),
                if (_isLongPressed)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      padding: EdgeInsets.all(8.0),
                      child:  Column(
                        children: [
                          Text(
                        widget.text,
                        style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 14)),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                      children: [
                        SizedBox(width: 5,),
                          Text(
                        widget.text2,
                        style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 16)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 2,),
                      Container(
                        child:  Row(
                          children: [
 Image.asset(
                  widget.imagePath2,
                  width:20,
                  height: 30,
                  fit: BoxFit.cover,
                  
                ),
SizedBox(width: 2,),
                Text(widget.text3,style: GoogleFonts.roboto(textStyle:TextStyle(fontWeight: FontWeight.normal)),)
                          ],
                        ),
                      )
                        ],)
                        ] 
                      )
                    ),
                  ),
              ],
            ),
          ),
        ),
      ));
    
  }
}