import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minimax/jogo_da_velha/box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool turn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Box(type: draw),
                  const VerticalDivider(),
                  Box(type: draw),
                  const VerticalDivider(),
                  Box(type: draw),
                ],
              ),
            ),
            const Divider(
              endIndent: 30,
              indent: 30,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Box(type: draw),
                  const VerticalDivider(),
                  Box(type: draw),
                  const VerticalDivider(),
                  Box(type: draw),
                ],
              ),
            ),
            const Divider(
              endIndent: 30,
              indent: 30,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Box(type: draw),
                  const VerticalDivider(),
                  Box(type: draw),
                  const VerticalDivider(),
                  Box(type: draw),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   draw() {
    turn = !turn;
      return turn
          ? Image.asset('images/x.png')
          : Image.asset('images/bola.png');
  }
}
