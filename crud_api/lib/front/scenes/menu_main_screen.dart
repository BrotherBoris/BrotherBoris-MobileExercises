import 'package:flutter/material.dart';
import 'package:crud_api/front/components/basic_button.dart';
import 'package:crud_api/front/scenes/game_list_screen.dart';

class MenuMainScreen extends StatefulWidget {
  const MenuMainScreen({super.key});

  @override
  State<MenuMainScreen> createState() => _MenuMainScreen();
}

class _MenuMainScreen extends State<MenuMainScreen> {
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
            const SizedBox(height: 10),
            BasicButton(
                buttonText: "Lista de Games",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameListScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
