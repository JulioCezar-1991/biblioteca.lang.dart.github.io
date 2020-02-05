import 'dart:convert';

void main() {
  String jsonData;
  jsonData = '''
 {
    "nome" : "Fernando", 
    "idade": 36, 
    "parentes": {
      "mae": "Marlene",
      "pai": "Delcio"
    },
    "tarefas": [
      "Pagar contas",
      "Estudar"
    ],
    "conjuge": {
      "nome" : "Leila", 
      "idade": 31,
      "parentes": {
        "mae": "Lindraci",
        "pai": "Pedro"
      }
    },
    "filhos" : [      
      {
        "nome" : "Chloe", 
        "idade": 1, 
        "vacinas": [
          "ACWY",
          "Sarampo"
        ]
      },
      {
        "nome" : "Bartolomeu", 
        "idade": 5, 
        "vacinas": [
          "ACWY",
          "Sarampo",
          "Meningite"
        ]
      }
    ],
    "bens": {
      "veiculos": [
        {
          "marca": "Maverick",
          "modelo": "Ford",
          "caracteristicas": {
            "tipo": "passeio",
            "passageiros": 5
          },
          "multas": [
            {
              "descrisao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descrisao": "Estacionar Local Proibido",
              "tipo": "Grave",
              "pontos": 4
            }
          ]
        },
        {
          "marca": "Kawasaki",
          "modelo": "Ninja H2R",
          "caracteristicas": {
            "tipo": "corrida",
            "passageiros": 2
          },
          "multas": [
            {
              "descrisao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descrisao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descrisao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            }
          ]
        }
      ],
      "imoveis": [
        {
          "tipo": "casa",
          "endereco": "Rua dos tolos, 0, Vila do Chaves",
          "contas": [
            {
              "tipo": "IPTU",
              "valor": 1000
            },
            {
              "tipo": "Condominio",
              "valor": 500
            }
          ]
        }
      ]
    }
  }''';

  // Regra #1 identificar e criar as classes de acordo com o json
  // Regra #2 criar os construtores do mais profundo ate a raiz
  // Regra #3 faca o tratamento de erros

  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  //print('parsedJson $parsedJson');
  Pessoa pessoa = Pessoa.fromJson(parsedJson);
  //print('Decode: $parsedJson');
  print('Uso Direto: ${parsedJson['bens']['veiculos'][0]['multas'][0]}\n');
  print('Uso OBJETO: ${pessoa.bens.veiculos.map((e) => e.multas.map((e) => e.descrisao))}\n');
  print('Uso OBJETO: ${pessoa.bens.veiculos.map((e) => e.marca).toList().toSet()}\n');


}

class Pessoa {
  String nome;
  int idade;
  Parentes parentes;
  List<String> tarefas;
  Conjuge conjuge;
  List<Filho> filhos;
  Bens bens;

  Pessoa(
      {this.nome,
      this.idade,
      this.parentes,
      this.tarefas,
      this.conjuge,
      this.filhos,
      this.bens});

  factory Pessoa.fromJson(Map<String, dynamic> json){
     // List<dynamic> lista = json['filhos'] as List;
     // List<Filho> dataLista = lista.map((e) => Filho.fronJson(e)).toList();

     return Pessoa(
            nome: json['nome'],
            idade: json['idade'],
            parentes: Parentes.fromJson(json['parentes']),
            tarefas: List<String>.from(json['tarefas']), // json['tarefas'].cast<String>()
            conjuge: Conjuge.fromJson(json['conjuge']),
            filhos:(json['filhos'] as List<dynamic>).map((e) => Filho.fronJson(e)).toList(),
            bens: Bens.fromJson(json['bens'])
            );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'parentes': parentes,
      'tarefas': tarefas,
      'conjuge': conjuge,
      'filhos': filhos,
      'bens': bens
    };
  }
}

class Parentes {
  String mae;
  String pai;

  Parentes({this.mae, this.pai});

  Parentes.fromJson(Map<String, dynamic> json)
      : this(
          mae: json['mae'],
          pai: json['pai'],
        );

  Map<String, dynamic> toJson() {
    return {
      'mae': mae,
      'pai': pai,
    };
  }
}

class Conjuge {
  String nome;
  int idade;
  Parentes parentes;

  Conjuge({this.nome, this.idade, this.parentes});

  Conjuge.fromJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          idade: json['idade'],
          parentes: Parentes.fromJson(json['parentes']),
        );
  Map<String, dynamic> tojson() {
    return {
      'nome': nome,
      'idade': idade,
      'parentes': parentes,
    };
  }
}

class Filho {
  String nome;
  int idade;
  List<String> vacinas;

  Filho({this.nome, this.idade, this.vacinas});

  Filho.fronJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          idade: json['idade'],
          vacinas: json['vacinas'].cast<String>(),
        );

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'vacinas': vacinas,
    };
  }
}

class Bens {
  List<Veiculo> veiculos;
  List<Imovel> imoveis;

  Bens({this.veiculos, this.imoveis});

  Bens.fromJson(Map<String, dynamic> json)
      : this(
          veiculos: (json['veiculos'] as List).map((e) => Veiculo.fromJson(e)).toList(),
          imoveis: (json['imoveis'] as List).map((e) => Imovel.fromJson(e)).toList(),
        );

  Map<String, dynamic> toJson() {
    return {
      'veiculos': veiculos,
      'imoveis': imoveis,
    };
  }
}
class Veiculo {
  String marca;
  String modelo;
  Caracteristicas caracteristicas;
  List<Multa> multas;

  Veiculo({this.marca, this.modelo, this.caracteristicas, this.multas});

  Veiculo.fromJson(Map<String, dynamic> json)
      : this(
          marca: json['marca'],
          modelo: json['modelo'],
          caracteristicas: Caracteristicas.fromJson(json['caracteristicas']),
          multas: (json['multas'] as List).map((e) => Multa.fromJson(e)).toList(),
        );
  Map<String, dynamic> toJson() {
    return {
      'marca': marca,
      'modelo': modelo,
      'catacteristicas': caracteristicas,
      'multas': multas,
    };
  }
}

class Caracteristicas {
  String tipo;
  int passageiros;

  Caracteristicas({this.tipo, this.passageiros});

  Caracteristicas.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          passageiros: json['passageiros'],
        );

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'passageiros': passageiros,
    };
  }
}

class Multa {
  String descrisao;
  String tipo;
  int pontos;

  Multa({this.descrisao, this.tipo, this.pontos});

  Multa.fromJson(Map<String, dynamic> json)
      : this(
          descrisao: json['descrisao'],
          tipo: json['tipo'],
          pontos: json['pontos'],
        );
  Map<String, dynamic> toJson() {
    return {
      'descrisao': descrisao,
      'tipo': tipo,
      'pontos': pontos,
    };
  }
}

class Imovel {
  String tipo;
  String endereco;
  List<Conta> contas;

  Imovel({this.tipo, this.endereco, this.contas});

  Imovel.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          endereco: json['endereco'],
          contas: (json['contas'] as List).map((e) => Conta.fromJson(e)).toList(),
        );

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'endereco': endereco,
      'contas': contas,
    };
  }
}

class Conta {
  String tipo;
  String valor;

  Conta({this.tipo, this.valor});

  Conta.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          valor: json['valo;r'],
        );

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'valor': valor,
    };
  }
}
