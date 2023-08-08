import 'package:flutter/material.dart';
import 'constantes.dart';

Widget titulosApp(String texto) {
  return Text(
    texto,
    style: TextStyle(
        fontFamily: 'Roboto',
        color: Constantes.CorTexto1,
        fontWeight: FontWeight.w700,
        fontSize: 20),
  );
}

Widget textoSimples(String texto, double tamanhoFonte) {
  return Text(
    texto,
    style: TextStyle(
        fontFamily: 'Roboto',
        color: Constantes.CorTexto1,
        fontSize: tamanhoFonte,
        fontWeight: FontWeight.w700),
  );
}

Widget CamposEditarHorario(String textoDia, String textoHorario) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Constantes.CorBorda,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5)),
    height: 34,
    width: 370,
    child: Stack(
      children: [
        Align(
            alignment: Alignment(-0.94, 0), child: textoSimples(textoDia, 15)),
        Align(
          alignment: Alignment(0.60, 0),
          child: textoSimples(textoHorario, 12),
        ),
        Align(
          alignment: Alignment(0.99, 0),
          child: Image.asset('lib/assets/recursos/editar.png'),
        )
      ],
    ),
  );
}

Widget linhaCinza() {
  return Divider(
    color: Colors.grey,
    thickness: 1.0,
    indent: 0,
    endIndent: 0,
  );
}

Widget redesSociais(String icon, String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 22),
    child: Stack(
      children: [
        Container(
          child: Row(
            children: [
              Align(
                alignment: Alignment(-0.29, 0.9),
                child: Image.asset(
                  icon,
                  height: 30,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Align(
                alignment: Alignment(-0.60, 0.2),
                child: Container(
                  height: 31,
                  width: 210,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Constantes.CorBorda,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          texto,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Constantes.CorTexto1,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        alignment: Alignment(-0.82, 0.0),
                      ),
                      Align(
                        alignment: Alignment(1, 1),
                        child: Image.asset('lib/assets/recursos/editar.png'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

//-------------------------------------------- ADM----------------------------------------------

Widget butaoAdm(
    String texto, String icone, BuildContext context, Widget destino) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => destino));
    },
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(240, 50)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Constantes.CorfundoBranca),
        elevation: MaterialStateProperty.all<double>(10),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ))),
    child: Align(
      alignment: Alignment.centerLeft, // Define o alinhamento do texto
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              texto,
              style: TextStyle(
                  color: Constantes.corFundo,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                  fontSize: 16),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ColorFiltered(
              colorFilter:
                  ColorFilter.mode(Constantes.corFundo, BlendMode.srcATop),
              child: Image.asset(
                icone,
                height: 40,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


/*Widget formSenha {
  bool _showpassord = false;
  return TextFormField(
                     style: new TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: Constantes.fonteRoboto,
                            ),
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock, color:  Colors.black,),
                              hintText: "Senha",
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              suffixIcon: GestureDetector(
                                child: Icon(_showpassord == false ? Icons.visibility_off: Icons.visibility,color: Colors.black,),
                                onTap: () {
                                  setState((){
                                    _showpassord = !_showpassord;
                                  });
                                },
                              )
                            ),
                            obscureText: _showpassord == false ? true: false,
                        );
}*/