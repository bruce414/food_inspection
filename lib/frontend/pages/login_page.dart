import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_inspection/frontend/pages/tracker_page.dart';

// import '../../components/bottom_navigation.dart';
// import 'home_page.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController myLoginEmailAddressController = TextEditingController();
  TextEditingController myLoginPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                ClipRRect(
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 0.6,
                    child: Image.asset(
                      "images/app_logo.png",
                      width: 350,
                      height: 300,
                    ),
                  ),
                ),
                // const SizedBox(height: 30.0,),
                //App name:
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "food",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      "Inspection",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0,),
                LogInTextField(hintText: "Email Address", myLogInTextController: myLoginEmailAddressController,),
                const SizedBox(height: 7.0,),
                LogInTextField(hintText: "Password", myLogInTextController: myLoginPasswordController,),
                const SizedBox(height: 10.0,),
                const Text("--------------------OR--------------------"),
                const SizedBox(height: 10.0,),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const BottomNavigationBarForUberEats()),
                    // );
                  },
                  child: const SignInButton(
                    text: "Sign in with Apple",
                    bgColor: Colors.black,
                    imagePath: 'images/apple_logo.jpeg',
                    imageWidth: 50.0,
                    imageHeight: 50.0,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 9.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TrackerPage()),
                    );
                  },
                  child: const SignInButton(
                    text: "Sign in with Google",
                    bgColor: Colors.white,
                    imagePath: 'images/google_logo.png',
                    imageWidth: 50,
                    imageHeight: 50,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const BottomNavigationBarForUberEats()),
                        // );
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogInTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController myLogInTextController;
  const LogInTextField({super.key, required this.hintText, required this.myLogInTextController});

  @override
  State<LogInTextField> createState() => _LogInTextFieldState();
}

class _LogInTextFieldState extends State<LogInTextField> {

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    widget.myLogInTextController.addListener(_printLatestValue);
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    widget.myLogInTextController.dispose();
    super.dispose();
  }
  void _printLatestValue() {
    final text = widget.myLogInTextController.text;
    print('Second text field: $text (${text.characters.length})');
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: TextField(
        controller: widget.myLogInTextController,
        decoration: InputDecoration(
          labelText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}


class SignInButton extends StatefulWidget {
  final String text;
  final Color bgColor;
  final String? imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle textStyle;
  const SignInButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.textStyle,
  });

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  Color colorForBorder = Colors.black;
  double spacingInBetweenIconAndText = 5;

  Color displayBorder() {
    if (widget.bgColor == Colors.white) {
      colorForBorder = Colors.black;
    } else {
      colorForBorder = Colors.white;
    }
    return colorForBorder;
  }

  void defineSpacingBetweenElements() {
    if (widget.text == "Sign up") {
      spacingInBetweenIconAndText = 40;
    } else {
      spacingInBetweenIconAndText = 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 300,
        height: 80,
        padding: const EdgeInsets.only(left: 20, right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.bgColor,
          border: Border.all(
            color: displayBorder(),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(widget.imagePath!),
              width: widget.imageWidth,
              height: widget.imageHeight,
            ),
            SizedBox(width: spacingInBetweenIconAndText),
            Text(
              widget.text,
              style: widget.textStyle,
            ),
          ],
        )
      // child: Text(
      //   text,
      //   style: textStyle,
      // ),
    );
  }
}
