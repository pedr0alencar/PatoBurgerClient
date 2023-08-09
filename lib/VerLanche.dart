import 'dart:math';

import 'package:flutter/material.dart';
import 'assets/constantes.dart';
import 'assets/widgetsFunctions.dart';

import 'modelo/item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class VerLanche extends StatefulWidget {
  final ItemCardapio item;

  VerLanche({required this.item});

  @override
  State<VerLanche> createState() => _editarItemState();
}

class _editarItemState extends State<VerLanche> {
  final TextEditingController hintNomeController = TextEditingController();
  final TextEditingController hintDetalhesController = TextEditingController();
  final TextEditingController hintIngredientesController =
      TextEditingController();
  final TextEditingController hintPrecoController = TextEditingController();

  //--------------------------------------- funcao que permite exibir o dialogo na tela, onde vai confirmar a exclusao

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hintNomeController.text = widget.item.nome;
    hintDetalhesController.text = widget.item.detalhes;
    hintIngredientesController.text = widget.item.ingredientes;
    hintPrecoController.text = widget.item.preco.toString();
  }

  void atualizarItens() async {
    String novoNome = hintNomeController.text;
    String novoDetalhes = hintDetalhesController.text;
    String novoIngredientes = hintIngredientesController.text;
    double novoPreco = double.parse(hintPrecoController.text);

    //  aqui faz a referência para o nó 'item'
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.reference().child('item');

    try {
      DatabaseEvent event = await databaseRef
          .orderByChild('nome')
          .equalTo(widget.item.nome)
          .once();
      DataSnapshot snapshot = event.snapshot;

      // Verificar se o nó foi encontrado
      if (snapshot.value != null) {
        // Pega a chave do nó encontrado
        Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
        String chaveNodo = data.keys.first;

        // Atualizar o objeto no Firebase usando a chave do nó encontrado
        databaseRef.child(chaveNodo).update({
          'nome': novoNome,
          'detalhes': novoDetalhes,
          'ingredientes': novoIngredientes,
          'preco': novoPreco,
        });

        Navigator.pop(context);
      } else {
        print('Item não encontrado no banco de dados.');
      }
    } catch (error) {
      print('Erro ao consultar o banco de dados: $error');
    }
  }

  void _exibirConfirmacaoExclusao(BuildContext context) async {
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.reference().child('item');

    DatabaseEvent event =
        await databaseRef.orderByChild('nome').equalTo(widget.item.nome).once();
    DataSnapshot snapshot = event.snapshot;

    // Verificar se o nó foi encontrado
    if (snapshot.value != null) {
      // Pega a chave do nó encontrado
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      String chaveNodo = data.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String hintNome = widget.item.nome;
    final String hintDetalhes = widget.item.detalhes;
    final String hintIngredientes = widget.item.ingredientes;
    final double hintPreco = widget.item.preco;
    final String hintImagem = widget.item.image;
    return Scaffold(
      backgroundColor: Constantes.corFundo,
      body: Stack(
        children: [
          Positioned(
            child: Text(
              'Cardápio',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
            top: 32,
            left: 146,
          ),
          Positioned(
              top: 258,
              //container do card branco
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 258,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 104, bottom: 10, left: 30, right: 30),
                  //container dos texfield
                  child: Container(
                      padding: EdgeInsets.only(top: 20),
                      //onde tudo fica empilhado
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Align(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 34,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 1),
                                      child: Text(
                                        hintNome,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Constantes.CorTitulo2),
                                      ),
                                    ),
                                  ),
                                  // detalhes
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment(-1, 0),
                                    child: Text('Detalhes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Color(0XFF434343),
                                            fontSize: 16)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  campoEditarItem(context,
                                      hintDetalhesController, hintDetalhes),
                                  // ingredientes
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment(-1, 0.1),
                                    child: Text('Ingredientes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Color(0XFF434343),
                                            fontSize: 16)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  //teste --------------------
                                  campoEditarItem(
                                      context,
                                      hintIngredientesController,
                                      hintIngredientes),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment(-1, -1),
                                    child: Text('Preço',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Color(0XFF434343),
                                            fontSize: 16)),
                                  ),
                                  campoEditarItem(context, hintPrecoController,
                                      hintPreco.toString()),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.14,
            left: MediaQuery.of(context).size.width * 0.5 - 178,
            child: SizedBox(
              width: 356,
              height: 304,
              child: Image.asset(hintImagem),
            ),
          ),
        ],
      ),
    );
  }
}
