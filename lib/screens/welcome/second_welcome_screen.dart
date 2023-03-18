import 'package:flutter/material.dart';
import 'package:redditech/components/welcome.dart';

class SecondWelcomeScreen extends StatelessWidget {
  const SecondWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomePage(
      image: 'assets/lottie/3d_mobile.json',
      title: 'Faut mettre un titre',
      subtitle: 'J\'ai pas d\'inspi pour l\'instant :/',
    );
  }
}
