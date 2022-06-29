import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'VideoItems.dart';

class Videoynat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN', style: GoogleFonts.rubikBeastly(fontSize: 17.0,
            color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      body: ListView(
        children: [
          SizedBox(height: 50.0),
          Container(
            height: 500.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.indigo.shade200]
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),

            child: VideoItems(
              videoPlayerController: VideoPlayerController.network(
                  'https://www.videoindirelim.com/downloads/d92ccb79b88f352a10efb59ef195c69f/'
              ),
              looping: false,
              autoplay: false,

            ),
          ),

        ],
      ),
    );
  }
}