import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Settings extends StatefulWidget {
  const Settings({super.key, required this.settings});

  // ignore: prefer_typing_uninitialized_variables
  final settings;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  handleChangeField(item) {
    print(item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 16),
          width: MediaQuery.of(context).size.width,
          child: const Text(
            textAlign: TextAlign.start,
            "Settings",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "IBM Plex Sans Regular",
              color: neutralDark0,
            ),
          ),
        ),
        Form(
            child: Column(
          children: [
            // ignore: unused_local_variable
            for (var item in widget.settings)
              TextFormField(
                onSaved: (newValue) => item = newValue,
                onChanged: handleChangeField,
                initialValue: item,
              )
          ],
        )),
      ],
    );
  }
}
