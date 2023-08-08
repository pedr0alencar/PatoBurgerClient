import 'package:flutter/material.dart';
import 'package:pato_burguer_client/assets/constantes.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: BorderSide.strokeAlignInside,
      color: Constantes.corFundo,
      child: Row(
        children: [
          Column(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
              Text("menu")
            ],
          ),
          Column(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
              Text("menu")
            ],
          ),
          Column(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
              Text("menu")
            ],
          ),
          Column(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
              Text("menu")
            ],
          )
        ],
      ),
    );
  }
}
