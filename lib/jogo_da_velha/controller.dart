import 'package:flutter/cupertino.dart';

class Controller {
  final _game = List<bool?>.generate(9, (index) => null);
  ValueNotifier<int> indexGame = ValueNotifier<int>(0);

  getValue(index) => _game[index];

  insertValue(index, player) {
    _game.insert(index, player);
    indexGame.value = index;
  }
}
