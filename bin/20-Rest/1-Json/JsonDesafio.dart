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

  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  print(parsedJson);
}

class Pessoa {
  String nome;
  int idade;
  Parentes parentes;
  List<String> tarefas;
  Conjuge conjuge;
  List<Filho> filhos;
  List bens;

  Pessoa(
      {this.nome,
      this.idade,
      this.parentes,
      this.tarefas,
      this.conjuge,
      this.filhos,
      this.bens});

  Pessoa.fromJson(Map<String, dynamic> json)
      : this(
            nome: json['nome'],
            idade: json['idade'],
            parentes: json['parentes'],
            tarefas: json['tarefas'],
            conjuge: json['conjuge'],
            filhos: json['filhos'],
            bens: json['bens']);

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
          parentes: json['parentes'],
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
          vacinas: json['vacinas'],
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
          veiculos: json['veiculos'],
          imoveis: json['imoveis'],
        );

  Map<String, dynamic> tojson() {
    return {
      'veiculos': veiculos,
      'imoveis': imoveis,
    };
  }
}

class Veiculo {
  String marca;
  String modelo;
  Caracteristicas catacteristicas;
  List<Multa> multas;

  Veiculo({this.marca, this.modelo, this.catacteristicas, this.multas});

  Veiculo.fromJson(Map<String, dynamic> json)
      : this(
          marca: json['marca'],
          modelo: json['modelo'],
          catacteristicas: json['catacteristicas'],
          multas: json['multas'],
        );
        Map<String, dynamic> toJson(){
          return {
            
          };
        }
}

class Caracteristicas {
  String tipo;
  int passageiros;

  Caracteristicas({this.tipo, this.passageiros});
}

class Multa {
  String descrisao;
  String tipo;
  int pontos;

  Multa({this.descrisao, this.tipo, this.pontos});
}

class Imovel {
  String tipo;
  String endereco;
  List<Conta> contas;

  Imovel({this.tipo, this.endereco, this.contas});
}

class Conta {
  String tipo;
  String valor;

  Conta({this.tipo, this.valor});
}
