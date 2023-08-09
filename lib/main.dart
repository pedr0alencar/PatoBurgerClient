import 'package:flutter/material.dart';
import 'package:pato_burguer_client/telaInicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    //Color minhaCor = const Color(0xFFFF9B0D);
    return MaterialApp(
      title: "PatoBurguer",
      home: TelaInicial(),
    );
  }
}
