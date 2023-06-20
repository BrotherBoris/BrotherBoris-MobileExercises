class Game {
  String? _id;
  String? _title;
  double? _price;
  String? _publisher;

  static int staticInt = 0;

  // constructor
  Game({String? id, String? title, String? publisher, double? price})
      : _id = id,
        _title = title,
        _publisher = publisher,
        _price = price;
  // constructor

  // Factory //
  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      title: map['title'] as String?,
      publisher: map['publisher'] as String?,
      price: (map['price'] as num?)?.toDouble(),
    );
  }

  // getters //
  String? get id => _id;
  String? get title => _title;
  double? get price => _price;
  String? get publisher => _publisher;
  // getters //

  // setters //
  set id(String? id) {
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
