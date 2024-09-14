import 'package:cinema/info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverExpandImage extends StatefulWidget {
  final String imagePath;
  final String imagePath2;
  final double width;
  final double height;
final String text;
final String text2;
final String text3;

  HoverExpandImage({
    required this.imagePath,
    required this.imagePath2,
    required this.width,
    required this.height,
    required this.text,
     required this.text2,
    required this.text3,
  });

  @override
  _HoverExpandImageState createState() => _HoverExpandImageState();
}

class _HoverExpandImageState extends State<HoverExpandImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => info(imagePath:widget.imagePath,text: widget.text,text2: widget.text2,),)), 
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
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
                  width: _isHovered ? widget.width * 1.2 : widget.width,
                  height: _isHovered ? widget.height * 1.2 : widget.height,
                  fit: BoxFit.cover,
                ),
                if (_isHovered)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                        widget.text,
                        style:GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 16)),
                        textAlign: TextAlign.center,
                      ),
                    Row(
                      children: [
                        SizedBox(width: 50,),
                          Text(
                        widget.text2,
                        style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 16)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 20,),
                      Container(
                        child:  Row(
                          children: [
 Image.asset(
                  widget.imagePath2,
                  width:20,
                  height: 30,
                  fit: BoxFit.cover,
                  
                ),
SizedBox(width: 10,),
                Text(widget.text3,style: GoogleFonts.roboto(textStyle:TextStyle(fontWeight: FontWeight.normal)),)
                          ],
                        ),
                      )
                      ],
                    )
                        ],
                      )
                    ),
                  ),
              ],
            ),
          ),
        ),
      ), )
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}