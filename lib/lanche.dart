import 'package:flutter/material.dart';
import 'assets/constantes.dart';
//import 'package:pato_burguer/editarItem.dart';
import 'modelo/item.dart';
import 'telaCardapio.dart';

class LancheCard extends StatelessWidget {
  final ItemCardapio item;
  final VoidCallback onTap;

  LancheCard(this.item, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFFFCB82),
          ),
          //color: Constantes.CorCardItem,
          width: 135,
          height: 168.2,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, -0.7),
                child: Image.asset(
                  item.image ?? 'lib/assets/recursos/imagem_padrao.png',
                  height: 114,
                  width: 134,
                ),
              ),
              Align(child: Text(item.nome), alignment: Alignment(0, 0.52)),
              Align(
                child: Text(
                  'R\$',
                  style: TextStyle(
                      color: Constantes.corFundo,
                      fontSize: 11,
                      fontWeight: FontWeight.w800),
                ),
                alignment: Alignment(-0.5, 0.88),
              ),
              Align(
                child: Text(
                  item.preco.toString(),
                  style: TextStyle(fontSize: 20, color: Color(0xFF434343)),
                ),
                alignment: Alignment(-0.1, 0.86),
              )
            ],
          )),
    );
  }
}
