/* 

  * Conceito
  - Then registra callbacks que serão chamadas quando o Futue for concluido.
  > onValue passado ao termino do Future.
  > catchError: Se omitido é lancado como uma exception.    
    > test: Se qualquer lógica retornar true é lancada a exception!
  > whwenComplete: Chama uma funcao anonima ao termino do Future

*/

// * FUNÇÕES ASSINCRONA
Future<String> tarefa({int tempo = 1}) {
  return status(tempo).then((msg) {
    return '\nStatus: $msg';
  }).catchError(
    (onError) {
      print('CatError: $onError');
    },
    test: (onError) => onError is! Future && onError.runtimeType != Future,
  ).whenComplete(() {
    print('Future complete');
  });
}

Future<String> status(int tempo) {
  return Future.delayed(
      Duration(seconds: tempo), () => Future.error('Erro intencional'));
  /* Future.delayed(Duration(seconds: tempo), () => 'Primeira Tarefa finalizada!\n'); */
}

// * FUNÇÕES SINCRONA
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
  contagem(segundos: 3);

  tarefa(tempo: 4).then((onValue) => print(onValue?? 'Status: nulo')); //funcao assincrona
}
