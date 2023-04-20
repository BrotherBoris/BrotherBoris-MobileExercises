import 'package:crud_api/back/models/game.dart';

class GameController {
  static List<Game> _listGames = [];
  Game? _game;

  // Getters //
  List<Game> get listGames {
    if (_listGames.isEmpty) {
      _listGames = Dumper().dump(30).cast<Game>();
    }
    return _listGames;
  }

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

  void update(Game game) {
    int index = _listGames.indexWhere((gameQuery) => gameQuery.id == game.id);
    if (index != -1) {
      _listGames[index] = game;
    }
  }

  void edit(Game game) {}

  void delete(int id) {
    _listGames.removeWhere((game) => game.id == id);
  }

  void cancel() {
    _game = null;
  }
}
