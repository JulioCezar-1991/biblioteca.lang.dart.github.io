/* 
  * Conceito
  - Mixin Permite implementar metodos e atributos de outras classes


  * Regras 
  - Devem ser implementado antes das interfaces
  - Pode ser Implementados a partir de uma classe concreta ou abstrata
  - Não pode implementar de uma classe que estenda e extendar de uma classe mixin
  - Pode implementar mais de um mixin, e não é obrigatorio usar todos os metodos e atributos
  - As classes que possuem metodos iguais serão sobrescritas em ordem ate a classe herdeira

  *ON
  - è obrigatorio declarar sua classe mixin
  - Restringi o uso do mixin as classes que estendem ou implementam a classe declarada
 */

// Classe abstrata
abstract class Cidadao {
  String nome;

  Cidadao(this.nome);

  void objetivosPessoais();

  void direitosDeveres() {
    print('Todo cidadao tem direitos e deveres');
  }
}

// Interfaces
abstract class Presidenciavel {
  String partido;
  String ideologia;

  void ideologiaPolitica();
}

class Postagem {
  String postagem;

  void escreverPostagem() {
    print('');
  }
}

// MIXIS

mixin Elegivel on Cidadao {
  bool elegivel = true;
  void prestacaoContas();
}

abstract class Conta {
  double _saldo, salario = 33000;

  get saldo => _saldo;
  set depositar(double valor) => _saldo = valor;

  bool declaracaoRenda() => _saldo / 12 < salario;
}

//Classe concreta
class Candidato extends Cidadao
    with Elegivel, Conta
    implements Postagem, Presidenciavel {
  String objetivo;

  // Extend
  Candidato(String nome, {this.ideologia, this.partido}) : super(nome) {
    direitosDeveres();
  }

  @override
  void objetivosPessoais() {
    print('$nome tem o objetivo de $objetivo');
  }

  // Interfaces
  @override
  String postagem;

  @override
  void escreverPostagem() {
    print('Postagem de $nome no facebook: $postagem');
  }

  @override
  String partido;

  @override
  String ideologia;

  @override
  void ideologiaPolitica() {
    print('$nome é cadidato com ideologia de $ideologia pelo partido $partido');
  }

  // Mixins
  @override
  void prestacaoContas() {
    elegivel = super.declaracaoRenda();
    if (elegivel) {
      print(
          'Candidato $nome passou na prestação de conta!\nAutorizado a concorrer nas eleções 2018!');
    } else {
      print(
          'Candidato $nome foi barrado na prestação de contas!\n Saldo  $saldo excede a renda desclarada para Presidente!');
    }
  }
}

void main() {
  var bolsonaro = Candidato('Bolsonaro', ideologia: 'Direita', partido: 'PSL');
  bolsonaro
    ..objetivo = 'Ganhar eleição'
    ..objetivosPessoais()
    ..postagem = 'Acabar com a corrupção no Brasil'
    ..escreverPostagem()
    ..ideologiaPolitica()
    ..depositar = 3905000
    ..prestacaoContas();
}
