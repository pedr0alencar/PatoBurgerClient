import 'package:flutter/material.dart';
import 'constantes.dart';

Widget tituloPreto(String titulo) {
  return Text(titulo,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: Color(0xFF434343)));
}

Widget tituloLaranja(String titulo) {
  return Text(titulo,
      style: TextStyle(
          fontFamily: Constantes.fonteRoboto,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: Constantes.corFundo));
}
