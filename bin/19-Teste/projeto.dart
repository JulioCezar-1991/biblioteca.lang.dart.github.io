int calculate() {
  return 6 * 7;
}

List<String> converterEmLista(String nome) {
  return nome.split(' ').toList();
  //return nome.split(' ').map((e) => e.toUpperCase()).toList(); // Simular erro
}

String recuperarNome(List<String> nomes){
  return nomes[0];
}

String maioridade(int idade) {
  try {
    if (idade < 0) throw Exception('A idade não pode ser negativa!');
    return idade < 14 ? 'Criança' : idade < 18 ? 'Adolecente' : 'Adulto';
  } catch (e) {
    print('Execao: $e');
    return null;
  }
}

String validarTelefone(String fone) {
  return fone.length == 8 ? 'Fone Valido' : ' Fone Invalido';
}

double restoDivisao(double a, double b){
  return a.remainder(b);
}
