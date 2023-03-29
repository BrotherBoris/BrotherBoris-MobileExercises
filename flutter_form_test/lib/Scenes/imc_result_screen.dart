import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_form_test/Components/basic_button.dart';

class IMCShowResultScreen extends StatefulWidget {
  String classificacao = "";
  double resultado = 0;

  IMCShowResultScreen({
    super.key,
    required this.classificacao,
    required this.resultado,
  });

  @override
  State<IMCShowResultScreen> createState() => _IMCShowResultScreen();
}

class _IMCShowResultScreen extends State<IMCShowResultScreen> {
  //constructor
  //IMCShowResultScreen({required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado"),
      ),
      body: Center(
        child: Column(
          //alinha no centro da tela
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.classificacao,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'IMC: ${widget.resultado}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            //botão componente
            MyButton(
                buttonText: "Calcular novamente",
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
