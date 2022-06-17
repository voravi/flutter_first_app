import 'package:flutter/material.dart';
import 'package:tic_tac_toe/assets/screens/google_auth_practice.dart';
import 'package:tic_tac_toe/assets/screens/home_page.dart';

import 'assets/screens/debugging_practice.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) =>  TicTacToe(),
      },
    );
  }
}
