import 'package:flutter/material.dart';
import 'package:pato_burguer_client/assets/constantes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main.dart';
import 'modelo/item.dart';
import 'lanche.dart';
import 'VerLanche.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class TelaCardapio extends StatefulWidget {
  @override
  State<TelaCardapio> createState() => _TelaCardapioState();
}

class _TelaCardapioState extends State<TelaCardapio> {
  List<ItemCardapio> _itens = [];
  List<ItemCardapio> _itensCategoriaSelecionada = [];
  List<ItemCardapio> _itensCarne = [];
  List<ItemCardapio> _itensFrango = [];
  List<ItemCardapio> _itensBebidas = [];
  List<ItemCardapio> _itensCombos = [];
  List<ItemCardapio> _itensPm = [];
  String opcao = 'carne';

  void _navegarParaVisualizar(BuildContext context, ItemCardapio item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerLanche(item: item),
      ),
    );
  }

  //List<ItemCardapio> _itens = [];

  @override
  void initState() {
    super.initState();
    _carregaDoFirebase();
    _atualizarItensCategoriaSelecionada(opcao);
  }

  void SeparaLista(
    List<ItemCardapio> lista,
    List<ItemCardapio> listaF,
    List<ItemCardapio> listaC,
    List<ItemCardapio> listaB,
    List<ItemCardapio> listaCo,
    List<ItemCardapio> listaPm,
  ) {
    for (int i = 0; i < lista.length; i++) {
      if (lista[i].tipo == "carne") {
        listaC.add(lista[i]);
      } else if (lista[i].tipo == "frango") {
        listaF.add(lista[i]);
      } else if (lista[i].tipo == "bebida") {
        listaB.add(lista[i]);
      } else if (lista[i].tipo == 'combo') {
        listaCo.add(lista[i]);
      } else if (lista[i].tipo == 'promocao') {
        listaPm.add(lista[i]);
      }
    }
  }

  void _carregaDoFirebase() async {
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child('item');

    try {
      DatabaseEvent event = await databaseRef.once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value == null) {
        print("Dados do Firebase estão vazios.");
        return;
      }
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      List<ItemCardapio> itens = [];

      data.forEach((key, value) {
        itens.add(ItemCardapio(
            value['nome'] ?? '',
            value['detalhes'] ?? '',
            value['ingredientes'] ?? '',
            (value['preco'] is int)
                ? (value['preco'] as int).toDouble()
                : (value['preco'] is double)
                    ? value['preco']
                    : 0.0,
            value['tipo'] ?? '',
            value['imagem'] ?? ''));
      });

      setState(() {
        _itens = itens;
        SeparaLista(itens, _itensFrango, _itensCarne, _itensBebidas,
            _itensCombos, _itensPm);
      });
    } catch (error) {
      print("Erro ao carregar dados do Firebase: $error");
    }
  }

  void _atualizarItensCategoriaSelecionada(String categoria) {
    setState(() {
      if (categoria == 'carne') {
        _itensCategoriaSelecionada = _itensCarne;
      } else if (categoria == 'frango') {
        _itensCategoriaSelecionada = _itensFrango;
      } else if (categoria == 'bebida') {
        _itensCategoriaSelecionada = _itensBebidas;
      } else if (categoria == 'combo') {
        _itensCategoriaSelecionada = _itensCombos;
      } else if (categoria == 'promocao') {
        _itensCategoriaSelecionada = _itensPm;
      } else {
        _itensCategoriaSelecionada =
            _itens; // Caso nenhuma categoria seja selecionada
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constantes.corFundo,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Positioned(
            top: 46,
            left: 152,
            child: Text(
              'Cardápio',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Positioned(
              top: 106,
              left: 30,
              child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _atualizarItensCategoriaSelecionada('promocao');
                          },
                          child: Text(
                            'PROMOÇÕES',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Constantes.corFundo)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            _atualizarItensCategoriaSelecionada('carne');
                          },
                          child: Text(
                            'CARNE',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Constantes.corFundo)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            _atualizarItensCategoriaSelecionada('frango');
                          },
                          child: Text(
                            'FRANGO',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Constantes.corFundo)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            _atualizarItensCategoriaSelecionada('combo');
                          },
                          child: Text(
                            'COMBOS',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Constantes.corFundo)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            _atualizarItensCategoriaSelecionada('bebida');
                          },
                          child: Text(
                            'BEBIDAS',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Constantes.corFundo)),
                        ),
                      ],
                    ),
                  ))),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 171,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                if (index < _itensCategoriaSelecionada.length) {
                  // Verifica se o índice é válido antes de retornar o LancheCard
                  return LancheCard(
                    _itensCategoriaSelecionada[index],
                    onTap: () => _navegarParaVisualizar(
                        context, _itensCategoriaSelecionada[index]),
                  );
                } else {
                  return null;
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
