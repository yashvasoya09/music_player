import 'package:flutter/material.dart';
import 'package:music_player/screen/provider/playprovider.dart';
import 'package:music_player/screen/view/play%20screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => provider(),),

      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          routes: {
            "/":(context) => playScreen(),
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    ),
  );
}
