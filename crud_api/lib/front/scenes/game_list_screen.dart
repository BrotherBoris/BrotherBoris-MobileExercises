import 'package:flutter/material.dart';
import 'package:crud_api/main.dart';
import 'package:crud_api/back/controllers/game_controller.dart';
import 'package:crud_api/front/components/basic_button.dart';
import 'package:crud_api/front/scenes/game_form_screen.dart';

class GameListScreen extends StatefulWidget {
  GameController gameController = GameController();

  GameListScreen({super.key});

  @override
  State<GameListScreen> createState() => _GameListScreen();
}

class _GameListScreen extends State<GameListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Games List"),
      ),
      body: Center(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              // * alinha no centro da tela
              children: <Widget>[
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Games",
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Price')),
                    DataColumn(label: Text('Publisher')),
                    DataColumn(label: Text('')),
                    DataColumn(label: Text(''))
                  ],
                  rows: widget.gameController.listGames
                      .map((game) => DataRow(cells: [
                            DataCell(Text(game.id.toString())),
                            DataCell(Text(game.title!)),
                            DataCell(Text("R\$${game.price.toString()}")),
                            DataCell(Text(game.publisher!)),
                            DataCell(BasicButton(
                              buttonText: "Edit",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameFormScreen(
                                            editableGame: game,
                                          )),
                                );
                              },
                            )),
                            DataCell(BasicButton(
                              buttonText: "Delete",
                              onPressed: () {
                                widget.gameController.delete(game);
                                setState(() {});
                              },
                            ))
                          ]))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
