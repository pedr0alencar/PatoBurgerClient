import 'package:flutter/material.dart';
import 'package:pato_burguer_client/VerContato.dart';
import 'package:pato_burguer_client/telaCardapio.dart';
import 'package:pato_burguer_client/telaInicial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    //Color minhaCor = const Color(0xFFFF9B0D);
    return MaterialApp(title: "PatoBurguer", home: TelaInicial());
    //home: TelaCardapio());
    //home: VerContato());
  }
}
