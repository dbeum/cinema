import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart'; 


class YouTubePlayer extends StatefulWidget {
  final String yurl;

   YouTubePlayer({required this.yurl});
  @override
  _YouTubePlayerState createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayer> {
  final _controller = YoutubePlayerController(); 
  @override 
  void initState() { 
    super.initState(); 
    // TO load a video by its unique id 
    _controller.loadVideoById(videoId: widget.yurl,
    
    ); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: Padding( 
        padding: const EdgeInsets.all(8.0), 
         
        child: Center( 
          // Youtube player as widget 
         child: SizedBox(
            width: 400,
            height: 150, // Set the width of the player
            child: AspectRatio(
              aspectRatio: 16 / 9,  // Maintain aspect ratio (you can modify if needed)
              child: YoutubePlayer(
                controller: _controller, // Your controller
              ),
            ),
          ),

        ), 
      ), 
    ); 
  } 
}