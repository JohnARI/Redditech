import 'package:flutter/material.dart';
import 'package:redditech/services/api_client.dart';
import 'dart:async';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> with TickerProviderStateMixin {
  Future<bool> checkIsAuth() async {
    return await api.checkIsAuth();
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
              print(await api.checkIsAuth());
              debugPrint(
                  '==============================================================');
            },
            child: const Text('checkIsAuth()'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () async {
              await api.authenticate(context);
              debugPrint(
                  '==============================================================');
            },
            child: const Text('Authentification'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () async {
              String? value = await storage.read(key: "credentials");
              print(value);
              debugPrint(
                  '==============================================================');
            },
            child: const Text('Check Credentials in localstorage'),
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
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () {
              print(api.reddit!.auth.credentials.toJson());
              debugPrint(
                  '==============================================================');
            },
            child: Text('Print credentials'),
          )
        ],
      ),
    );
  }
}
