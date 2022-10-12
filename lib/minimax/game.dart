class Game{
  late int state;
  late List<Game> children;
  late List<bool?> game;
  late int height;
  late Game? dad;
  late int useful;

  Game({required this.state, required this.dad, required this.height}){
    children = List.empty(growable: true);
  }
}