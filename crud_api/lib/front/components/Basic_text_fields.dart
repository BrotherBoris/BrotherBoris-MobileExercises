import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  final String fieldLabel;
  final TextEditingController controller;

  const BasicTextField({super.key, required this.fieldLabel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: TextField(
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: fieldLabel,
          )),
    );
  }
}

class BasicTextFieldForm extends StatelessWidget {
  final String fieldlabel;
  final TextEditingController controller;

  final String defaultValidatorText;
  final String? validator;

  const BasicTextFieldForm({super.key, required this.fieldlabel, required this.controller, required this.defaultValidatorText, required this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350.0,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: fieldlabel),
          validator: (value) {
            validator;
          },
          onSaved: (value) {
            print(value);
          },
        ));
  }
}
