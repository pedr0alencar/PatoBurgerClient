import 'package:flutter/material.dart';
import 'assets/constantes.dart';
import 'assets/widgetsFunctions.dart';

class TelaInicial extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constantes.corFundo,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color(0xFFFCFCFC),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 50,
                    left: 122,
                    child: tituloPreto(Constantes.textoTitulo)),
                Positioned(
                    top: 50,
                    left: 182,
                    child: tituloLaranja(Constantes.textoTitulo2)),
                Positioned(top: 110, left: 40, child: tituloPreto('Promoção')),
                Positioned(top: 140, left: 40, child: tituloLaranja('Semanal')),
                // -------------------------------//
                // container do item da promoção
                Positioned(
                    top: 178,
                    left: 60,
                    child: Stack(
                      children: [
                        Container(
                            width: 200,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: CardPromocao(
                                'X-Lombo de pato', '24.00', '20%')),
                      ],
                    )),
                Align(
                    alignment: Alignment(0.44, -0.42),
                    child: Image.asset(
                      'lib/assets/recursos/pato-bacon_solo.png',
                      height: 192,
                      width: 180,
                    )),

                // ----- item 2
                Positioned(
                    top: 298,
                    left: 60,
                    child: Stack(
                      children: [
                        Container(
                            width: 200,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: CardPromocao(
                                'X-Pato Calabresa', '45.00', '15%')),
                      ],
                    )),
                Align(
                    alignment: Alignment(0.44, 0.15),
                    child: Image.asset(
                      'lib/assets/recursos/pato-bacon_solo.png',
                      height: 192,
                      width: 180,
                    )),

                Positioned(
                    top: 420,
                    left: 56,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 126,
                          height: 138,
                          child: Stack(children: [
                            Image.asset('lib/assets/recursos/hamburger.png')
                          ]),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          color: Colors.white,
                          width: 126,
                          height: 138,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
