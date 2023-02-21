import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redditech/common/const.dart';

class AddPostForm extends StatefulWidget {
  const AddPostForm({super.key, this.form});

  final form;

  @override
  State<AddPostForm> createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  handleChangeField(item) {
    print(item);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        for (var item in widget.form)
          if (item['type'] == 'text')
            TextFormField(
              maxLines: item['maxLines'],
              onTap: () => print(item),
              decoration: InputDecoration(
                labelText: item['name'],
              ),
              style: const TextStyle(
                fontFamily: "IBM Plex Sans Regular",
                color: neutralDark3,
              ),
              onSaved: (newValue) => item = newValue,
              onChanged: handleChangeField,
              initialValue: item['value'],
            )
          else if (item['type'] == 'select')
            DropdownButtonFormField<String>(
              value: item['options'][0],
              items:
                  item['options'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  item['value'] = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: item['name'],
              ),
            )
      ]),
    );
  }
}
