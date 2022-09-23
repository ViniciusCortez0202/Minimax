import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minimax/jogo_da_velha/box.dart';
import 'package:minimax/jogo_da_velha/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool turn = false;
  final controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: collumn(),
        ),
      ),
    );
  }

  collumn() {
    var list = List<Widget>.empty(growable: true);
    for (int i = 0; i < 3; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(12.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row(i),
          ),
        ),
      ));
      if (i != 2) list.add(const Divider());
    }
    return list;
  }

  row(i) {
    var list = List<Widget>.empty(growable: true);
    for (int j = i * 3; j < (i * 3) + 3; j++) {
      list.add(Box(type: draw, controller: controller, index: (j + 1)));
      if ((j+1) % 3 != 0) list.add(const VerticalDivider());
    }
    return list;
  }

  draw() {
    turn = !turn;
    return turn;
  }
}
