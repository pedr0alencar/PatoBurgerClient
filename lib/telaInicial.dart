import 'package:flutter/material.dart';
import 'assets/constantes.dart';
import 'assets/widgetsFunctions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TelaInicial extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constantes.corFundo,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 70,
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
                  child: Container(
                    width: 126,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Posição da sombra (x, y)
                        ),
                      ],
                    ),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment(0, -0.8),
                        child: Image.asset(
                          'lib/assets/recursos/hamburguer.png',
                          height: 100,
                          width: 400,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.7),
                        child: Text(
                          'Cardápio',
                          style: TextStyle(
                              fontSize: 20, color: Constantes.corFundo),
                        ),
                      )
                    ]),
                  ),
                ),

                Positioned(
                  top: 420,
                  left: 230,
                  child: Container(
                    width: 126,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Posição da sombra (x, y)
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -40,
                          left: -56,
                          child: Image.asset(
                            'lib/assets/recursos/telefone.png',
                            height: 210,
                            width: 240,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.7),
                          child: Text(
                            'Contato',
                            style: TextStyle(
                                fontSize: 20, color: Constantes.corFundo),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Positioned(
            top: 650,
            left: 40,
            child: Container(
              height: 68,
              width: 300,
              child: Row(
                children: [
                  /*Image.asset('lib/assets/recursos/botao-de-inicio.png'),*/
                  Column(
                    children: [
                      SizedBox(
                        height: 6,
                      ),
                      SvgPicture.asset(
                        'lib/assets/recursos/noun_Home_3804013.svg',
                        width: 40,
                        height: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 3.5,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 0.4,
                      ),
                      SvgPicture.asset(
                        'lib/assets/recursos/noun_Hamburger_2077474.svg',
                        width: 50,
                        height: 50,
                        color: Colors.white,
                      ),
                      Text(
                        'Lanches',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      SvgPicture.asset(
                        'lib/assets/recursos/noun_Drink_3815069.svg',
                        width: 50,
                        height: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.7,
                      ),
                      Text(
                        'Bebidas',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(width: 35),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'lib/assets/recursos/noun_hamburgercombo_958560.svg',
                        width: 30,
                        height: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8.8,
                      ),
                      Text(
                        'Combos',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
