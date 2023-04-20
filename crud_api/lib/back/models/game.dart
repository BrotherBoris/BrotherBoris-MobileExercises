import 'dart:math';

class Game {
  int? _id;
  String? _title;
  double? _price;
  String? _publisher;

  static int staticInt = 0;

  // constructor
  Game([this._id, this._title, this._price, this._publisher]);

  // getters //
  int? get id => _id;
  String? get title => _title;
  double? get price => _price;
  String? get publisher => _publisher;
  // getters //

  // setters //
  set id(int? id) {
    _id = id;
  }

  set title(String? title) {
    _title = title;
  }

  set price(double? price) {
    _price = price;
  }

  set publisher(String? publisher) {
    _publisher = publisher;
  }
  // setters //

  @override
  String toString() {
    return 'Game(id: $_id, title: $_title, price: $_price, publisher: $_publisher)';
  }
}

class Dumper {
  List dump(iterations) {
    List<Game> list = [];

    for (var i = 0; i < iterations; i++) {
      list.add(Game(i, 'Game $i', Random().nextDouble() * 500, 'pub $i'));
    }

    return list;
  }
}
