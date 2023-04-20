import 'package:crud_api/back/models/game.dart';
import 'package:crud_api/back/validators/validator_form.dart';
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
  final String fieldLabel;
  final TextEditingController controller;

  final Function(String?) onSaved;
  final List<String? Function(String?)> validators;

  const BasicTextFieldForm({super.key, required this.fieldLabel, required this.controller, required this.validators, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350.0,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: fieldLabel),
          //keyboardType: TextInputType.,
          validator: ValidatorForm.combinedValidator(validators),
          onSaved: (value) {
            onSaved;
          },
        ));
  }
}

class NumberTextFieldForm extends StatelessWidget {
  final String fieldLabel;
  final TextEditingController controller;

  final Function(String?) onSaved;
  final List<String? Function(String?)> validators;

  const NumberTextFieldForm({super.key, required this.fieldLabel, required this.controller, required this.validators, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350.0,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: fieldLabel),
          keyboardType: TextInputType.datetime,
          validator: ValidatorForm.combinedValidator(validators),
          onSaved: (value) {
            onSaved;
          },
        ));
  }
}
