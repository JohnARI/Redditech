import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/components/text_button.dart';
import 'package:redditech/screens/auth/auth.dart';
import 'package:redditech/screens/welcome/first_welcome_screen.dart';
import 'package:redditech/screens/welcome/second_welcome_screen.dart';
import 'package:redditech/screens/welcome/third_welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController controller = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                isLast = (index == 2);
              });
            },
            controller: controller,
            children: const [
              FirstWelcomeScreen(),
              SecondWelcomeScreen(),
              ThirdWelcomeScreen(),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButtonStyle(
                      text: 'Skip',
                      onpressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthScreen()));
                      }),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      radius: 4,
                      dotColor: Colors.grey,
                      activeDotColor: medium0,
                    ),
                  ),
                  isLast
                      ? TextButtonStyle(
                          text: 'Done',
                          onpressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AuthScreen()));
                          })
                      : TextButtonStyle(
                          text: 'Next',
                          onpressed: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          })
                ],
              ))
        ],
      ),
    ));
  }
}
