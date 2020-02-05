import 'dart:math';

class PessoaFactory {
  static final PessoaFactory instancia =
      PessoaFactory._construtorNomeado('Indefinido');
  String nome;

  factory PessoaFactory() => instancia;

  PessoaFactory._construtorNomeado(this.nome) {
    // Configurações iniciais
  }
}

class PessoaInstancia {
  static PessoaInstancia instancia;
  String nome;
  final int _identidade;

  factory PessoaInstancia({String nome = 'indefinido', int identidade}) {
    identidade =
        (identidade == null) ? Random().nextInt(99999999 + 1) : identidade;
    return instancia ?? PessoaInstancia._construtorNomeado(nome, identidade);
  }

  PessoaInstancia._construtorNomeado(this.nome, this._identidade) {
    // Configurações iniciais
  }

  int get identidade => _identidade;

}
