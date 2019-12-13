/* 

  * Conceito
    - Representational State Transfer (Transferência Representacional de Estado)
    - É uma arquitetura que define um conjunto de restrinções na criaçao de web services.
    - É uma padronização para multiplas aplicações possam se cominicar usando protocolo HTTP.

  * SERIALIZAÇÃO MANUAL - Biblioteca json integrada ao dart 'dart:convert':

  * Serialização Json direta
    - Perde recursos estático de linguagens
    - Segurança de tipo, autocompletar e exceções de tempo de compilação.
 */

import 'dart:convert';

void conversaoDireta() {
  String jsonData;

  jsonData = '''{
    "nome" : "Julio",
    "idade" : 28,
    "email" : "julio@gmail"
  }''';

  // DECODE

  print('==================== Conversao Direta DECODE ====================');

  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  print('parsedJson: $parsedJson');
  String nome = parsedJson['nome'];
  int idade = parsedJson['idade'];
  String email = parsedJson['email'];
  print('Uso direto: nome: $nome  idade: $idade  email: $email \n');

  // ENCODE

  print('==================== Conversao Direta ENCODE ====================');
  Map<String, dynamic> map;

  map = {'nome': nome, 'idade': idade, 'email': email};

  String toJson;
  toJson = jsonEncode(map);
  print('ToJson $toJson\n');
}

/*

 * Serialização JSON em Objeto
   - Utiliza resursos entaticos da linguagens:
   - Segurançãs de tipos, autocompletar e exceções de tempo de compilação.

 */

void conversaoObjetos() {
  String jsonData;

  jsonData = '''
  [
    {
    "nome" : "Julio",
    "idade" : 28,
    "email" : "julio@gmail"
    },
    {
      "nome" : "Laynna",
      "idade" : 29,
      "email" : "laynna@gmail"
    }
  ]
  ''';

  // DECODE
  print('==================== Conversao Objeto DECODE ====================');
  List<dynamic> parsedJson = jsonDecode(jsonData);
  print('parsedJson: $parsedJson\n');
  ListaUsuarios listaUsuarios;
  listaUsuarios = ListaUsuarios.fromJson(parsedJson);
  print(
      'USO Objeto: email:${listaUsuarios.usuarios[0].email}  idade: ${listaUsuarios.usuarios.elementAt(0).idade}\n');

  var usuario = listaUsuarios.usuarios.singleWhere((e) => e.nome == 'Laynna');
  print(
      'USO Objeto SingleWhere: nome:${usuario.nome}  email:${usuario.email}\n');

  var usuarioNovo = Usuario.fromJson(
      {'nome': 'Clovis', 'idade': 120, 'email': 'diluvio@gmail'});
  listaUsuarios.usuarios.addAll([usuarioNovo]);

  // ENCODE

  print('==================== Conversao Objeto ENCODE ====================');
  /* List<dynamic> lista = listaUsuarios.toJson();

  String toJson = json.encode(lista);
  print('toJson: $toJson'); */
}

void main() {
  conversaoDireta();
  conversaoObjetos();
}

class ListaUsuarios {
  List<Usuario> usuarios;

  ListaUsuarios({this.usuarios});

  //factory ListaUsuarios.fromJson(List<dynamic> json) {
  //  return ListaUsuarios(
  //    usuarios: json.map((e) => Usuario.fromJson(e)).toList(),
  //  );
  //}

  //? Contrutor factory retorna uma nova instancia do construtor default da classe a partir de um map
  ListaUsuarios.fromJson(List<dynamic> json)
      : this(
          usuarios: json.map((e) => Usuario.fromJson(e)).toList(),
        );

  List<dynamic> toJson() {
    return usuarios;
  }
}

class Usuario {
  final String nome;
  final int idade;
  final String email;

  //? Construtor default da classe
  Usuario({this.nome, this.idade, this.email});

  //? Construtor nomeado para criar uma nova instancia a partir de um app
  //Usuario.fromJson(Map<String, dynamic> json) {
  //  return Usuario(
  //    this.nome: json['nome'];
  //    this.idade: json['idade'];
  //    this.email: json['email'];
  //  );
  //}

  //? Contrutor factory retorna uma nova instancia do construtor default da classe a partir de um map
  //factory Usuario.fromJson(Map<String, dynamic> json) {
  //  return Usuario(
  //    nome: json['nome'],
  //    idade: json['idade'],
  //    email: json['email'],
  //  );
  //}

  //? Contrutor factory retorna uma nova instancia do construtor default da classe a partir de um map
  Usuario.fromJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          idade: json['idade'],
          email: json['email'],
        );
}
