import 'package:crud_api/front/components/basic_button.dart';
import 'package:crud_api/front/components/Basic_text_fields.dart';
import 'package:flutter/material.dart';

class GameFormScreen extends StatefulWidget {
  const GameFormScreen({super.key});

  @override
  State<GameFormScreen> createState() => _GameFormScreen();
}

class _GameFormScreen extends State<GameFormScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Games"),
      ),
      body: Center(
        child: Column(
            //alinha no centro da tela
            children: <Widget>[
              const SizedBox(height: 10),
              SizedBox(
                  width: 350.0,
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(border: const OutlineInputBorder(), labelText: "fieldlabel"),
                    validator: (value) {
                      if (value == null || value.length < 10) {
                        return 'Please enter your name';
                      }
                      return value;
                    },
                    onEditingComplete: () {
                      Form.of(context).validate();
                    },
                  )),
              const SizedBox(height: 10),
              BasicTextField(fieldLabel: "Title", controller: _titleController),
              const SizedBox(height: 10),
              BasicTextField(fieldLabel: "Price", controller: _priceController),
              const SizedBox(height: 10),
              BasicTextField(fieldLabel: "Publisher", controller: _publisherController),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BasicButton(buttonText: "Salvar", onPressed: () {}),
                    const SizedBox(width: 10),
                    BasicButton(buttonText: "Limpar", onPressed: () {}),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
