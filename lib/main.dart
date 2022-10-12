import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minimax/jogo_da_velha/controller.dart';
import 'package:minimax/myApp.dart';

GetIt getIt = GetIt.instance;

void main() {

  getIt.registerSingleton<Controller>(Controller());

  runApp(const MyApp());
}