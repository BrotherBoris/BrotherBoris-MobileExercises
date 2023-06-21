import 'package:crud_api/back/repository/game_repository.dart';
import 'package:crud_api/back/models/game.dart';

class GameController {
  List<Game> _listGames = [];
  Game? _game;
  GameRepository gameRepository = GameRepository();

  // Getters //
  Future<List<Game>> get listGames async {
    if (_listGames.isEmpty) {
      _listGames = await gameRepository.pullGames();
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
    gameRepository.createGame(game);
  }

  //void read() {}

  void update(Game game) {
    gameRepository.updateGame(game);
  }

  //void edit(Game game) {}

  void delete(Game game) {
    gameRepository.deleteGame(game.id!);
    _listGames = [];
  }

  /* void clear() {
    _game = null;
  } */
}
