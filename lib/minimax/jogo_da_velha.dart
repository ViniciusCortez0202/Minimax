import 'package:get_it/get_it.dart';
import 'package:minimax/jogo_da_velha/controller.dart';
import 'package:minimax/minimax/game.dart';
import 'package:minimax/util/Iminimax.dart';

class MinimaxJogoDaVelha implements IMinimax {
  late List<bool?> _game;
  int states = 1;
  final Game tree = Game(state: 1, dad: null, height: 0);

  MinimaxJogoDaVelha() {
    GetIt getIt = GetIt.I;
    _game = getIt<Controller>().gameClone();
    tree.game = _game;
  }

  @override
  createStates(bool turn, Game dad) {
    if (!_game.contains(null)) {
      return false;
    }
    for (int i = 0; i < 9; i++) {
      if (_game[i] != null) continue;
      Game newTree = Game(state: ++states, dad: dad, height: dad.height + 1);
      newTree.game = dad.game.toList();
      newTree.game.fillRange(i, i, turn);
      dad.children.add(newTree);
      newTree.useful = useful(turn) - useful(!turn);
    }
    return true;
  }

  @override
  search(bool turn, Game next) {
    if (turn) {
      if (createStates(turn, next)) {
        next.children.sort((a, b) => (a.useful >= b.useful ? 1 : 0));
        return search(!turn, next.children.first);
      }
      return next;
    }
    if (createStates(turn, next)) {
      next.children.sort((a, b) => (a.useful < b.useful ? 1 : 0));
      return search(!turn, next.children.first);
    }
    return next;
  }

  @override
  useful(bool turn) {
    int count = 0;
    for (int i = 0; i < 3; i++) {
      bool flag = true;
      for (int j = i * 3; j < (i * 3) + 3; j++) {
        if (_game[j] != turn || _game[j] != null) {
          flag = false;
          break;
        }
      }
      if (flag) count++;
    }
    for (int i = 0; i < 3; i++) {
      bool flag = true;
      for (int j = 0, k = i; j < 3; j++, k += 3) {
        if (_game[k] != turn || _game[k] != null) {
          flag = false;
          break;
        }
      }
      if (flag) count++;
    }

    if ((_game[1] != turn || _game[1] != null) &&
        (_game[5] != turn || _game[5] != null) &&
        (_game[9] != turn || _game[9] != null)) {
      count++;
    }
    if ((_game[3] != turn || _game[3] != null) &&
        (_game[5] != turn || _game[5] != null) &&
        (_game[7] != turn || _game[7] != null)) {
      count++;
    }

    return count;
  }
}
