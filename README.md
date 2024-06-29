
# Custom intro Screen 

Welcome to the Custom Intro Screen package by Codebyte Tech. This Flutter package allows you to create a customizable introduction screen for your Flutter application. It provides a seamless and interactive way to introduce your app's features to users.


## Features

- Display a series of intro screens with images, titles, and descriptions.
- Customizable button color for the "Get Started" button.
- Optional callbacks for "Get Started" and "Skip" actions.
- Show a custom widget if the intro has already been shown.

## Installation

Install custom intro screen with flutter

Add the following to your pubspec.yaml file:

```bash
   dependencies:
  custom_intro_screen: ^1.0.0
```
    
## Usage/Examples

Here's a basic example of how to use the Custom Intro Screen package:

```flutter
 IntroductionScreen(
        buttoncolor: const Color.fromARGB(255, 51, 94, 247),
        onGetStarted: () => log("Get Started"),
        onSkip: () => log("Skip"),
        context: context,
        introShownWidget: Scaffold(body: Center(child: const Text("Intro already shown"))),
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
```




## parameters

- required List<String> imageurl: A list of image paths for the intro screens.
- required List<String> titles: A list of titles for the intro screens.
- required List<String> descriptions: A list of descriptions for the intro screens.
- required Color buttoncolor: The color of the "Get Started" button.
- Function? onGetStarted: Callback function to be called when the "Get Started" button is pressed.
- Function? onSkip: Callback function to be called when the "Skip" button is pressed.
- required Widget introShownWidget: A widget to be displayed if the intro has already been shown.
- required BuildContext context: The build context of the application.
## Contributing

Contributions are always welcome!

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.


## License

[BSD-3-Clause](https://pub.dev/packages/custom_intro_screen/license)


## Support

For support, email itsmeaashisharyal@gmail.com.

