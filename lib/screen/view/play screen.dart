import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/screen/provider/playprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class playScreen extends StatefulWidget {
  const playScreen({Key? key}) : super(key: key);

  @override
  State<playScreen> createState() => _playScreenState();
}


class _playScreenState extends State<playScreen> {

  @override
  void initState() {
    Provider.of<provider>(context,listen: false).initmusic();

    super.initState();
  }
  provider? ProviderT;
  provider? ProviderF;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("song1", style: GoogleFonts.oswald()),
        leading: Icon(Icons.arrow_back_rounded),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.favorite, color: Colors.grey),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              height: 80.w,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://play-lh.googleusercontent.com/QovZ-E3Uxm4EvjacN-Cv1LnjEv-x5SqFFB5BbhGIwXI_KorjFhEHahRZcXFC6P40Xg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Song1",
            style: GoogleFonts.oswald(color: Colors.white, fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            "Artist",
            style: GoogleFonts.oswald(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Slider(
              value: 0,
              onChanged: (value) => Container(),
              activeColor: Colors.indigoAccent,
              inactiveColor: Colors.white),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("00:00", style: TextStyle(color: Colors.white)),
                Text("00:00", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.restart_alt_outlined, color: Colors.white, size: 25),
                Icon(Icons.keyboard_double_arrow_left,
                    color: Colors.white, size: 25),
                FloatingActionButton(
                    onPressed: () {
                      ProviderT!.musicrun();
                    },
                    child:
                        Icon(Icons.play_arrow, color: Colors.white, size: 30),
                    focusColor: Colors.purple,
                    backgroundColor: Colors.indigo),
                Icon(Icons.keyboard_double_arrow_right,
                    color: Colors.white, size: 25),
                Icon(Icons.loop, color: Colors.white, size: 25),
              ],  
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    ));
  }
}
