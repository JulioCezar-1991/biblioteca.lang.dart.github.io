
import 'Cidadao.dart';
import 'Postagem.dart';
import 'Presidenciavel.dart';

class Candidato extends Cidadao implements Postagem, Presidenciavel {
  String objetivo;

  // Extend
  Candidato(String nome, {this.ideologia, this.partido}) : super(nome) {
    direitosDeveres();
  }

  @override
  void objetivosPessoais() {
    print('$nome tem o objetivo de $objetivo');
  }

  // Interface Postagem
  @override
  String postagem;

  @override
  void escreverPostagem() {
    print('Postagem de $nome no facebook: $postagem');
  }

  // Imterface Presidenciavel
  @override
  String partido;

  @override
  String ideologia;

  @override
  void ideologiaPolitica() {
    print('$nome é cadidato com ideologia de $ideologia pelo partido $partido');
  }
}
