import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionScreen extends StatefulWidget {
  /// this is the package for the introduction screen
  /// it is a simple introduction screen that can be used to introduce the app to the user
  /// it has a skip button and a get started button
  ///
  /// it has a page indicator to show the current page
  /// it has a page view to show the pages
  /// it has a page controller to control the pages
  /// it has a list of images, titles and descriptions for the pages
  ///
  /// it has a list of navigation buttons for the pages
  /// it has a list of page indicators for the pages
  ///
  /// the required parameter for the introduction screen are given below
  /// the key parameter is optional
  /// parameter are [imageurl], [titles], [descriptions], [buttoncolor], [introShownWidget] are required
  /// parameter are [onGetStarted], [onSkip] are optional

  const IntroductionScreen({
    key,
    required this.imageurl,
    required this.titles,
    required this.descriptions,
    required this.buttoncolor,
    this.onGetStarted,
    this.onSkip,
    required this.introShownWidget,
  });

  /// the list of images for the pages
  /// the images are in the form of a list of strings
  /// [imageurl] is a required parameter
  /// paramter [imageurl] is assets image url or path
  /// example: ["assets/images/image1.png", "assets/images/image2.png"]
  ///
  final List<String> imageurl;

  /// the list of titles for the pages
  /// the titles are in the form of a list of strings
  /// [titles] is a required parameter
  /// the titles are the titles for the pages

  final List<String> titles;

  /// the list of descriptions for the pages
  /// the descriptions are in the form of a list of strings
  /// [descriptions] is a required parameter
  /// the descriptions are the descriptions for the pages
  /// example: ["description1", "description2"]

  final List<String> descriptions;

  /// this parameter for the button color\
  /// the color of the button is the color of the button
  /// the color of the button is the color of the button
  /// [buttoncolor] is a required parameter

  final Color buttoncolor;

  /// function for the get started button
  /// the function for the get started button
  /// [onGetStarted] is an optional parameter
  /// example: () => print("Get Started") or navigate to another screen or else
  ///
  final VoidCallback? onGetStarted;

  /// function for the skip button
  /// the function for the skip button
  /// [onSkip] is an optional parameter
  /// example: () => print("Skip") or navigate to another screen or else
  ///
  final VoidCallback? onSkip;

  /// function for the intro shown
  /// if intro is shown already then it will not show again
  /// [introShownWidget] is an optional parameter
  /// example: () => print("Intro shown") or navigate to another screen or else
  ///
  final Widget introShownWidget;

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 4;
  bool _showIntro = true;

  @override
  void initState() {
    super.initState();
    _checkIfIntroShown();
  }

  Future<void> _checkIfIntroShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('showIntro') ?? true;

    if (showIntro) {
      await prefs.setBool('showIntro', false);
    }

    setState(() {
      _showIntro = showIntro;
    });

    log(_showIntro.toString());
  }

  @override
  Widget build(BuildContext context) {
    if (_showIntro) {
      return Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _numPages,
                itemBuilder: (BuildContext context, int index) {
                  return buildPage(index);
                }),
            buildNavigationButtons(),
            buildPageIndicator(),
          ],
        )),
      );
    } else {
      return widget.introShownWidget;
    }
  }

  Widget buildPage(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: widget.onSkip,
              child: const Text(
                "Skip",
                style: TextStyle(),
              )),
        ),
        Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image.asset(widget.imageurl[index])),
        Text(
          widget.titles[index],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.descriptions[index],
          style: const TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildPageIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicatorItems(),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicatorItems() {
    List<Widget> indicators = [];

    for (int i = 0; i < _numPages; i++) {
      indicators.add(
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }

    return indicators;
  }

  Widget buildNavigationButtons() {
    return Positioned(
      bottom: 100,
      left: 16.0,
      right: 16.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // if (_currentPage != 0)
          //   ElevatedButton(
          //     onPressed: () {
          //       _pageController.previousPage(
          //         duration: const Duration(milliseconds: 500),
          //         curve: Curves.ease,
          //       );
          //     },
          //     child: const Text("Skip"),
          //   )
          // else
          //   Container(), // Show the Skip button on all pages except the first page
          if (_currentPage != _numPages - 1)
            InkWell(
              onTap: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: widget.buttoncolor),
                  alignment: Alignment.center,
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            )
          else
            InkWell(
              onTap: widget.onGetStarted,
              child: Container(
                  height: 50,
                  width: 240,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                      color: widget.buttoncolor),
                  alignment: Alignment.center,
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            )
        ],
      ),
    );
  }
}
