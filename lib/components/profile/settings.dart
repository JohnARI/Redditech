import 'package:flutter/material.dart';
import 'package:redditech/common/const.dart';
import 'package:redditech/services/api_client.dart';

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

  handleUpdateDisplayName(String displayName) {
    print(displayName);
  }

  handleSaveProfile() {
    setState(() => isEditing = !isEditing);

    if (isEditing) return;

    api.patch('', {});
  }

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 16),
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
                onPressed: () => handleSaveProfile,
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
              // ignore: unused_local_variable
              for (var item in widget.settings)
                // Checkbox(value: false, onChanged: (bool? value) {})
                if (item['type'] == 'text')
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: item['name'],
                    ),
                    style: const TextStyle(
                      color: neutralDark3,
                    ),
                    enabled: isEditing,
                    onSaved: (newValue) => item = newValue,
                    onChanged: handleChangeField,
                    initialValue: item['value'],
                  )
                else if (item['type'] == 'select')
                  DropdownButtonFormField<String>(
                    value: item['value'],
                    items: item['options']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: isEditing
                        ? (String? newValue) {
                            setState(() {
                              item['value'] = newValue;
                              print(widget.settings);
                            });
                          }
                        : null,
                    decoration: InputDecoration(
                      labelText: item['name'],
                    ),
                  )
            ],
          )),
        ),
      ],
    );
  }
}
