import 'package:crud_api/back/models/game.dart';

class GameController {
  List<Game> _listGames = [];
  Game? _game;

  // Getters //
  List<Game> get listGames => _listGames;
  Game? get game => _game;
  // Getters //
  // setters //
  void setGame(Game? game) {
    _game = game;
  }

  void setListGames(List<Game> list) {
    _listGames = list;
  }
  // setters //

  void create(Game game) {
    int newId = _listGames.isNotEmpty ? _listGames.last.id! + 1 : 1;
    game.id = newId;

    _listGames.add(game);
  }

  void read() {}

  void edit(Game game) {
    int index = _listGames.indexWhere((g) => g.id == game.id);
    if (index != -1) {
      _listGames[index] = game;
    }
  }

  void delete(int gameId) {
    _listGames.removeWhere((game) => game.id == gameId);
  }

  void cancel() {
    _game = null;
  }
}
