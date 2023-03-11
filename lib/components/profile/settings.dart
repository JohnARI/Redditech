import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/services/api_client.dart';

class Settings extends StatefulWidget {
  const Settings({super.key, required this.settings});

  // ignore: prefer_typing_uninitialized_variables
  final Map<String, dynamic> settings;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  handleSaveSettings() async {
    setState(() => isEditing = !isEditing);

    if (isEditing) return;

    Map<String, String> prefrences = {
      'nightmode': widget.settings['nightmode'].toString(),
      'accept_pms': widget.settings['accept_pms'].toString(),
      'label_nsfw': widget.settings['label_nsfw'].toString(),
      'country_code': widget.settings['country_code'].toString(),
      'lang': widget.settings['lang'].toString(),
      'activity_relevant_ads':
          widget.settings['activity_relevant_ads'].toString(),
    };

    await api.patch('/api/v1/me/prefs', prefrences);
  }

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 24, top: 16, right: 24),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                textAlign: TextAlign.start,
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                  color: neutralDark0,
                ),
              ),
              IconButton(
                icon: Icon(isEditing ? Icons.check : Icons.edit),
                tooltip: isEditing ? 'Save' : 'Edit',
                onPressed: () => handleSaveSettings(),
              ),
            ],
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 16),
          child: Form(
              child: Column(
            children: [
              CheckboxListTile(
                  title: const Text("Nightmode"),
                  value: widget.settings['nightmode'],
                  onChanged: isEditing
                      ? (value) =>
                          setState(() => widget.settings['nightmode'] = value!)
                      : null),
              CheckboxListTile(
                  title: Text("NSFW"),
                  value: widget.settings['label_nsfw'],
                  onChanged: isEditing
                      ? (value) =>
                          setState(() => widget.settings['label_nsfw'] = value!)
                      : null),
              CheckboxListTile(
                  title: const Text("Enable relevant ads"),
                  value: widget.settings['activity_relevant_ads'],
                  onChanged: isEditing
                      ? (value) => setState(() =>
                          widget.settings['activity_relevant_ads'] = value!)
                      : null),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: neutralLight0,
                  labelText: 'Language',
                ),
                value: widget.settings['lang'],
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                style: const TextStyle(color: neutralDark0),
                onChanged: isEditing
                    ? (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          widget.settings['lang'] = value!;
                        });
                      }
                    : null,
                items:
                    langOptions.map<DropdownMenuItem<String>>((dynamic value) {
                  return DropdownMenuItem<String>(
                    value: value['tag'],
                    child: Text(value['nativeName']),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: neutralLight0,
                  labelText: 'Country',
                ),
                value: widget.settings['country_code'],
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                style: const TextStyle(color: neutralDark0),
                onChanged: isEditing
                    ? (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          widget.settings['country_code'] = value!;
                        });
                      }
                    : null,
                items: countryCodeOptions
                    .map<DropdownMenuItem<String>>((dynamic value) {
                  return DropdownMenuItem<String>(
                    value: value['code'],
                    child: Text(value['name']),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: neutralLight0,
                  labelText: 'Accept PMs',
                ),
                style: const TextStyle(color: neutralDark0),
                value: widget.settings['accept_pms'],
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                onChanged: isEditing
                    ? (String? value) {
                        setState(() {
                          widget.settings['accept_pms'] = value!;
                        });
                      }
                    : null,
                items: acceptPmsOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: () {
                  api.logout(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 236, 117, 127),
                ),
                child: const Text('Logout'),
              )
            ],
          )),
        ),
      ],
    );
  }
}
