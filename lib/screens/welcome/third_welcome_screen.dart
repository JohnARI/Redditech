import 'package:flutter/material.dart';
import 'package:redditech/components/welcome.dart';

class ThirdWelcomeScreen extends StatelessWidget {
  const ThirdWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomePage(
      image: 'assets/lottie/get_started.json',
      title: 'Get started with RIEN!',
      subtitle: 'La aussi j\'ai pas trop d\'inspi :/',
    );
  }
}