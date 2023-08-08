import 'package:flutter/material.dart';
import 'recursos/constantes.dart';
import 'recursos/functions.dart';

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
                    top: 52,
                    left: 116,
                    child: tituloPreto(Constantes.textoTitulo)),
                Positioned(
                    top: 52,
                    left: 176,
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
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(-0.5, -0.68),
                                child: Text(
                                  'X-Lombo de Pato',
                                  style: TextStyle(
                                      color: Constantes.corNomeLanche,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.74, -0.1),
                                child: Text(
                                  '20%',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.058, -0.11),
                                child: Text('de Desconto'),
                              ),
                              Align(
                                alignment: Alignment(-0.74, 0.4),
                                child: Text(
                                  'R\$',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Align(
                                  alignment: Alignment(-0.48, 0.54),
                                  child: Text(
                                    '0,00',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF434343)),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )),
                Align(
                    alignment: Alignment(0.44, -0.42),
                    child: Image.asset(
                      'lib/recursos/images/pato-bacon_solo.png',
                      height: 192,
                      width: 180,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
