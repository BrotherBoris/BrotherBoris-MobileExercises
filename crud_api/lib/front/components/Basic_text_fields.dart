import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  final TextEditingController controller;
  final String fieldLabel;

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
  final TextEditingController controller;
  final String fieldlabel;

  const BasicTextFieldForm({super.key, required this.controller, required this.fieldlabel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350.0,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: fieldlabel),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return value;
          },
          onEditingComplete: () {
            Form.of(context).validate();
          },
        ));
  }
}
