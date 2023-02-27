import 'package:flutter/material.dart';
import 'package:redditech/screens/home/main_home_screen.dart';
import 'package:redditech/services/authentication.dart';
import 'dart:async';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> with TickerProviderStateMixin {
  Future<bool> checkIsAuth() async {
    return await authentification.checkIsAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () async {
              print(await authentification.checkIsAuth());
              debugPrint(
                  '==============================================================');
            },
            child: Text('checkIsAuth()'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () async {
              await authentification.authenticate(context);
              debugPrint(
                  '==============================================================');
            },
            child: Text('Authentification'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () async {
              String? value = await storage.read(key: "token");
              print(value);
              debugPrint(
                  '==============================================================');
            },
            child: Text('Check Token'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () async {
              print(await checkIsAuth());
              debugPrint(
                  '==============================================================');
            },
            child: Text('Check variable isAuth'),
          )
        ],
      ),
    );
  }
}
