import 'package:flutter/material.dart';
import 'package:redditech/components/bottom_navbar.dart';
import 'package:redditech/components/appbar.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/services/api_client.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _Welcome();
}

class _Welcome extends State<Welcome> with TickerProviderStateMixin {
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
            onPressed: () {
              apiAuth();
              debugPrint(
                  '==============================================================');
            },
            child: Text('TextButton'),
          )
        ],
      ),
    );
  }
}
