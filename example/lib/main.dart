import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intro_screen/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IntroductionScreen(
        buttoncolor: Colors.blueGrey,
        onGetStarted: () => log("Get Started"),
        onSkip: () => log("Skip"),
        introShownWidget:
            Scaffold(body: Center(child: const Text("Intro already shown"))),
        imageurl: [
          "assets/intro1.png",
          "assets/intro2.png",
          "assets/intro3.png",
          "assets/intro4.png",
        ],
        titles: [
          "Welcome to the Intro Screen",
          "Welcome to the Intro Screen",
          "Welcome to the Intro Screen",
          "Welcome to the Intro Screen"
        ],
        descriptions: [
          "This is a simple intro screen package for flutter",
          "This is a simple intro screen package for flutter",
          "This is a simple intro screen package for flutter",
          "This is a simple intro screen package for flutter"
        ],
      ),
    );
  }
}
