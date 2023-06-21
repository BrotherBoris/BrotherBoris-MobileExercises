import 'package:crud_api/back/models/game.dart';
import 'package:pocketbase/pocketbase.dart';

class GameRepository {
  final _pb = PocketBase('http://127.0.0.1:8090');

  Future<void> _createConnection() async {
    try {
      final authData = await _pb.admins.authWithPassword('adm@adm.com', '0123456789');
    } catch (e) {
      print("Generic error message(API Connection");
      return;
    }
  }

  void _clearConnection() {
    try {
      _pb.authStore.clear();
    } catch (e) {
      print("Generic error message(API Desconnection");
    }
  }

  Future<List<Game>> pullGames() async {
    await _createConnection();

    List<RecordModel> records = [];
    try {
      records = await _pb.collection('game').getFullList(
            sort: 'created',
          );
    } catch (e) {
      print("Generic error message(Pull Game Data)");
    }

    List<Game> gameList = [];

    for (var i = 0; i < records.length; i++) {
      gameList.add(Game.fromMap(records.elementAt(i).data));
      gameList.last.id = records.elementAt(i).id;
    }

    _clearConnection();
    return gameList;
  }

  void createGame(Game game) async {
    await _createConnection();
    final gameMap = <String, dynamic>{"title": game.title, "price": game.price, "publisher": game.publisher};

    try {
      final record = await _pb.collection('game').create(body: gameMap);
    } catch (e) {
      print("Generic error message(Create Game)");
    }
    _clearConnection();
  }

  void updateGame(Game game) async {
    await _createConnection();
    final gameMap = <String, dynamic>{"title": game.title, "price": game.price, "publisher": game.publisher};
    try {
      final record = await _pb.collection('game').update(game.id!, body: gameMap);
    } catch (e) {
      print("Generic error message(Update Game)");
    }
    _clearConnection();
  }

  void deleteGame(String id) async {
    await _createConnection();
    try {
      await _pb.collection('game').delete(id);
    } catch (e) {
      print("Generic error message(Delete Game)");
    }
    _clearConnection();
  }
}
