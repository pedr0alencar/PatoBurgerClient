import 'package:flutter/material.dart';
import 'package:pato_burguer_client/navBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(bottom: 0, left: 0, child: NavBar()),
        SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [Text("oie --------------------------")],
          ),
        )),
      ]),
    );
  }
}
