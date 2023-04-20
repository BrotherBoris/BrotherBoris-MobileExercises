import 'dart:math';

import 'package:crud_api/back/models/game.dart';
import 'package:crud_api/front/scenes/game_form_screen.dart';
import 'package:crud_api/front/scenes/test_screen.dart';
import 'package:crud_api/front/scenes/testgame_screen.dart';
import 'package:flutter/material.dart';
import 'package:crud_api/front/scenes/game_list_screen.dart';
import 'front/components/basic_button.dart';

void main() {
  runApp(const MyApp());
}

// teste
// * teste
// ! teste
// ? teste
// TODO teste

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // ! change after testing
      home: GameFormScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Games"),
      ),
      body: Center(
        child: Column(
          //alinha no centro da tela
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BasicButton(
                buttonText: "Form",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameFormScreen()),
                  );
                }),
            const SizedBox(height: 10),
            BasicButton(
                buttonText: "List",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GameListScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(200, (index) => {"id": index, "title": "Item $index", "price": Random().nextInt(10000)});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]['title'])),
      DataCell(Text(_data[index]['price'].toString())),
      DataCell(BasicButton(
        buttonText: "Editar",
        onPressed: () {
          print(index);
        },
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
