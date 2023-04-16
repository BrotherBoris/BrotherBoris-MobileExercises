import 'package:crud_api/front/components/basic_button.dart';
import 'package:crud_api/main.dart';
import 'package:flutter/material.dart';

class GameListScreen extends StatefulWidget {
  const GameListScreen({super.key});

  @override
  State<GameListScreen> createState() => _GameListScreen();
}

class _GameListScreen extends State<GameListScreen> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Games"),
      ),
      body: Center(
        child: Column(
          // * alinha no centro da tela
          children: <Widget>[
            //TODO: Find a way to space columns
            PaginatedDataTable(
              // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
              columns: [DataColumn(label: Text('ID')), DataColumn(label: Text('Name')), DataColumn(label: Text('Price')), DataColumn(label: Text(''))],
              source: _data,
              header: const Center(
                child: Text("LIST"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
