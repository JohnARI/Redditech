import 'package:flutter/material.dart';
import 'package:redditech/components/welcome.dart';

class FirstWelcomeScreen extends StatelessWidget {
  const FirstWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomePage(
      image: 'assets/lottie/build_app.json',
      title: 'Welcome to RIEN',
      subtitle: 'The reddit client developed by \n -Dany Leguy \n -Ludovic Debever \n -John Aristosa',
    );
  }
}
