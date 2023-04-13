import 'package:flutter/material.dart';
import 'package:crud_api/components/basic_button.dart';

class GamesListScreen extends StatefulWidget {
  const GamesListScreen({super.key});

  @override
  State<GamesListScreen> createState() => _GamesListScreen();
}

class _GamesListScreen extends State<GamesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Games"),
      ),
      body: DataTable(
        columns: [
          DataColumn(label: Text('Titulo')),
          DataColumn(label: Text('Preço')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Jogo1')),
            DataCell(Text('R\$50')),
          ]),
          DataRow(cells: [
            DataCell(Text('Jogo2')),
            DataCell(Text('R\$120')),
          ]),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
