//
// * Future
//  - É o  objeto que retorna um valor ou erro, resultado de uma execucao assincrona/futura.abstract
//

//Funcao retorna string
String tarefa({int tempo = 1}) {
  var msg = status(tempo);
  return 'Status: $msg';
}

Future<String> status(int tempo) {
  return Future.delayed(
      Duration(seconds: tempo), () => 'Primeira Tarefa finalizada!\n');
}

void novaTarefa({int tempo = 1}) {
  Future.delayed(Duration(seconds: tempo),
      () => print('\nStatus: Segunda tarefa finalizada!'));
}

void excecao({int tempo = 1}) => Future.delayed(
    Duration(seconds: tempo), () => throw Exception('Erro intencional'));

void contagem({int segundos = 3}) {
  print('Carregando...\n');
  for (var i = 1; i <= segundos; i++) {
    Future.delayed(Duration(seconds: i), () {
      print('${i * 33}%');
      if (i == segundos) {
        print("\nConcluido!");
      }
    });
  }
}

void main() {
  print(tarefa(tempo: 4));

  contagem(segundos: 3);

  excecao(tempo: 6);

  novaTarefa(tempo: 3);
}
