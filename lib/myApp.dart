import 'package:flutter/material.dart';
import 'package:minimax/jogo_da_velha/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Minimax',
      home: Home()
      );
  }
}
