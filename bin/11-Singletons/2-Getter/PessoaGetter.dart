class PessoaGetter {
  static final PessoaGetter _instancia = PessoaGetter._construtorNomeado();
  String nome;

  PessoaGetter._construtorNomeado();

  static PessoaGetter get instancia {
    return _instancia;
  }
}
