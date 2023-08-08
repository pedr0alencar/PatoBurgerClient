import 'package:flutter/material.dart';
import 'package:pato_burguer_client/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Color minhaCor = const Color(0xFFFF9B0D);
    return const MaterialApp(
      title: "PatoBurguer",
      home: HomeScreen(),
    );
  }
}
