import 'dart:ffi';

class ItemCardapio {
  String _nome = '';
  String _detalhes = "";
  String _ingredientes = "";
  double _preco = 0.00;
  String _tipo = '';
  String _imageUrl = '';

  ItemCardapio(String nome, String detalhes, String ingredientes, double preco,
      String tipo, String imageUrl) {
    this._nome = nome;
    this._detalhes = detalhes;
    this._ingredientes = ingredientes;
    this._preco = preco;
    this._tipo = tipo;
    this._imageUrl = imageUrl;
  }

  String get nome => _nome;

  set nome(String valor) {
    _nome = valor;
  }

  String get detalhes => _detalhes;

  set detalhes(String valor) {
    _detalhes = valor;
  }

  String get ingredientes => _ingredientes;

  set ingredientes(String valor) {
    _ingredientes = valor;
  }

  double get preco => _preco;

  set preco(double valor) {
    _preco = valor;
  }

  String get tipo => _tipo;

  set tipo(String valor) {
    _tipo = valor;
  }

  String get image => _imageUrl;

  set image(String valor) {
    _imageUrl = valor;
  }
}
