import '../minimax/game.dart';

abstract class IMinimax{
  createStates(bool turn, Game dad);
  useful(bool turn);
  search(bool turn, Game next);
}