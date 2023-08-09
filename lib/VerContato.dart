import 'package:flutter/material.dart';
import 'assets/constantes.dart';
import 'assets/widgetsFunctions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class VerContato extends StatefulWidget {
  @override
  State<VerContato> createState() => _VerContatoState();
}

class _VerContatoState extends State<VerContato> {
  String endereco = '';
  String cidade = '';
  String segSex = '';
  String sabado = '';
  String domFeriados = '';
  String whatsapp = '';
  String facebook = '';
  String instagram = '';
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _carregaDoFirebase();
  }

  void _carregaDoFirebase() async {
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child('contato');

    try {
      DatabaseEvent event = await databaseRef.once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value == null) {
        print("Dados do Firebase estão vazios.");
        return;
      }
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

      setState(() {
        endereco = data['endereco'] ?? '';
        segSex = data['horarioSegSext'] ?? '';
        sabado = data['horarioSabadp'] ?? '';
        domFeriados = data['horarioDomFer'] ?? '';
        whatsapp = data['whatsapp'] ?? '';
        facebook = data['facebook'] ?? '';
        instagram = data['instagram'] ?? '';
      });
    } catch (error) {
      print("Erro ao carregar dados do Firebase: $error");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constantes.corFundo.value),
      body: Stack(
        children: [
          Positioned(
            child: Text(
              'Alterar Contato',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
            top: 32,
            left: 130,
          ),
          Positioned(
              top: 80,
              //container de fundo ------------------------------------------------------------------
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18))),
                child: Padding(
                  /*padding: const EdgeInsets.all(17.0),*/
                  padding: const EdgeInsets.only(top: 17, bottom: 17, left: 0),
                  child: Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(-0.89, -1),
                          child: titulosApp('Endereço:'),
                        ),
                        Align(
                          alignment: Alignment(-1, -0.88),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),

                              // container endereço ------------------------------------------------------ C
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 5, left: 5, bottom: 5),
                                  height: 54,
                                  width: 370,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(-1, -0.7),
                                        child: Text(
                                          endereco,
                                          style: TextStyle(
                                              color: Constantes.CorTexto1,
                                              fontFamily: 'Roboto',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      /* InkWell(
                                        onTap: () {
                                          setState(() {
                                            isEditing = true;
                                          });
                                        },
                                        child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Image.asset(
                                                'lib/assets/recursos/editar.png')
                                                ),
                                      ),*/
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'Campo Grande-MS',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              color: Constantes.CorTexto1,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  )),
                              // linha ---------------------------- ?
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                child: linhaCinza(),
                              ),
                              Align(
                                alignment: Alignment(-0.72, -0.4),
                                child: titulosApp('Horários de Funcionamento:'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CamposEditarHorario('Segunda à sexta', segSex),
                              SizedBox(
                                height: 5,
                              ),
                              CamposEditarHorario('Sábado', sabado),
                              SizedBox(
                                height: 5,
                              ),
                              CamposEditarHorario(
                                  'Domingos e Feriados', domFeriados),
                              SizedBox(
                                height: 10,
                              ),
                              linhaCinza(),
                              Align(
                                alignment: Alignment(-0.79, -1),
                                child: titulosApp('Faça seu pedido em:'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              redesSociais(
                                  'lib/assets/recursos/whatsapp.png', whatsapp),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment(-0.79, -0.5),
                                child: titulosApp('Redes Sociais:'),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              redesSociais(
                                  'lib/assets/recursos/facebook.png', facebook),
                              SizedBox(
                                height: 10,
                              ),
                              redesSociais('lib/assets/recursos/instagram.png',
                                  instagram),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
