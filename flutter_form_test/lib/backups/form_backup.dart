/* import 'package:flutter/material.dart';
import 'package:flutter_form_test/Components/mybuttom1.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
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
  int _counter = 0;
  double _resultado = 0;
  String _classificacao = "";

  final TextEditingController _controladorPeso = TextEditingController();
  final TextEditingController _controladorAltura = TextEditingController();


  void _incrementCounter() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _classificacao,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'IMC: $_resultado',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350.0,
              child: TextField(
                  controller: _controladorPeso,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Peso',)),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350.0,
              child: TextField(
                  controller: _controladorAltura,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Altura',)),
            ),
            SizedBox(height: 10),
            MyButton(
              buttonText: "Calcular IMC",
              onPressed: (){
                final double? peso = double.tryParse(_controladorPeso.text);
                final double? altura = double.tryParse(_controladorAltura.text);

                setState(() {
                  double resultado = (peso as double)/((altura as double)*(altura as double));
                  _resultado = double.parse(resultado.toStringAsFixed(1));

                  ////switch////////switch////
                  if (_resultado <= 18.5) {
                    _classificacao = "MAGREZA";
                  } else if (_resultado <= 24.9) {
                    _classificacao = "NORMAL";
                  } else if (_resultado <= 29.9) {
                    _classificacao = "SOBREPESO";
                  } else if (_resultado <= 39.9) {
                    _classificacao = "OBESIDADE";
                  } else if (_resultado >= 40) {
                    _classificacao = "OBESIDADE GRAVE";
                  } else {
                    _classificacao = "";
                  }
                  ////switch////////switch////

                });
              },

            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
 */