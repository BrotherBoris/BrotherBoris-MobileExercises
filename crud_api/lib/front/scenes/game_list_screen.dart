import 'package:crud_api/back/models/game.dart';
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
      appBar: AppBar(title: const Text("Games List"), automaticallyImplyLeading: false),
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
                Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  BasicButton(
                      buttonText: "Add Game",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => GameFormScreen()),
                        );
                      }),
                  const SizedBox(width: 10),
                  BasicButton(
                      buttonText: "Return",
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ])),
                FutureBuilder<List<Game>>(
                  future: widget.gameController.listGames,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Display a loading indicator while fetching data
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Handle error state
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Data has been fetched successfully, build the DataTable
                      return DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Price')),
                          DataColumn(label: Text('Publisher')),
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('')),
                        ],
                        rows: snapshot.data!
                            .map((game) => DataRow(cells: [
                                  DataCell(Text(game.id.toString())),
                                  DataCell(Text(game.title ?? '')),
                                  DataCell(Text("R\$${game.price!.toStringAsFixed(2)}")),
                                  DataCell(Text(game.publisher ?? '')),
                                  DataCell(BasicButton(
                                    buttonText: "Edit",
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GameFormScreen(
                                            editableGame: game,
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                                  DataCell(BasicButton(
                                    buttonText: "Delete",
                                    onPressed: () {
                                      widget.gameController.delete(game);
                                      setState(() {});
                                    },
                                  )),
                                ]))
                            .toList(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
