import 'package:flutter/material.dart';
import 'package:flutter_form_test/Components/basic_button.dart';
import 'package:flutter_form_test/Scenes/imc_result_screen.dart';

class IMCFillDataScreen extends StatefulWidget {
  @override
  State<IMCFillDataScreen> createState() => _IMCFillDataScreen();
}

class _IMCFillDataScreen extends State<IMCFillDataScreen> {
  final TextEditingController _controladorPeso = TextEditingController();
  final TextEditingController _controladorAltura = TextEditingController();

  //constructor
  //IMCFillDataScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preencha os seus dados"),
      ),
      body: Center(
        child: Column(
          //alinha no centro da tela
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350.0,
              child: TextField(
                  controller: _controladorPeso,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Peso',
                  )),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350.0,
              child: TextField(
                  controller: _controladorAltura,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Altura',
                  )),
            ),
            SizedBox(height: 10),
            MyButton(
                buttonText: "Calcular",
                onPressed: () {
                  final double? peso = double.tryParse(_controladorPeso.text);
                  final double? altura = double.tryParse(_controladorAltura.text);

                  double resultado = (peso as double) / ((altura as double) * (altura as double));
                  resultado = double.parse(resultado.toStringAsFixed(2));

                  String classificacao = "";

                  if (resultado <= 18.5) {
                    classificacao = "MAGREZA";
                  } else if (resultado <= 24.9) {
                    classificacao = "NORMAL";
                  } else if (resultado <= 29.9) {
                    classificacao = "SOBREPESO";
                  } else if (resultado <= 39.9) {
                    classificacao = "OBESIDADE";
                  } else if (resultado >= 40) {
                    classificacao = "OBESIDADE GRAVE";
                  } else {
                    classificacao = "";
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IMCShowResultScreen(
                              resultado: resultado,
                              classificacao: classificacao,
                            )),
                  );
                }),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
