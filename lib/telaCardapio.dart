import 'package:flutter/material.dart';
import 'package:pato_burguer_client/assets/constantes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main.dart';
import 'modelo/item.dart';
import 'lanche.dart';
import 'lancheExibicao.dart';

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

  @override
  void initState() {
    super.initState();
    _carregaDoFirebase();
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
      });
    } catch (error) {
      print("Erro ao carregar dados do Firebase: $error");
    }
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                if (index < _itens.length) {
                  // Verifica se o índice é válido antes de retornar o LancheCard
                  return LancheCard(
                    _itens[index],
                    onTap: () => ViewLanche(/*context, _itens[index]*/),
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
