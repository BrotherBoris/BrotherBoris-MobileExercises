import 'package:flutter/material.dart';
import 'package:flutter_form_test/Scenes/imc_data_screen.dart';
import 'package:flutter_form_test/Scenes/imc_result_screen.dart';
import 'package:flutter_form_test/Components/basic_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Índice de Massa Corporal",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            MyButton(
                buttonText: "Calcular IMC",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IMCFillDataScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
