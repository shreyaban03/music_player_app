import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/common/color_extension.dart';
import 'package:music_player_app/view/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:"Circular Std",
        scaffoldBackgroundColor:TColor.bg,
        textTheme:Theme.of(context).textTheme.apply(
          bodyColor:TColor.primaryText,
          displayColor:TColor.primaryText,
          ),
          colorScheme:ColorScheme.fromSeed(
            seedColor:TColor.primary,
            ),
            useMaterial3:false,
      ),
      home:const SplashView(),
    );
        }
}