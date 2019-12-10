/* 
  *Sincrona:
  - Operações sincronas: Bloqueia a execução atá que seja concluida
  - Funções sícrona: Executa somente operaçõs sincrona

  * Assincrona:
  - Operações assincrona: Permitindo executar outras operações enquanto são processadas.
  - Funções Assíncronas: Executa ao menos umao peração assíncrona e operações síncrona. 

  * Await:
  - Indica a espera uma operação assincrona, conclusão de uma future!

  *Async:
  -É deve ser usada em todas funções que tenha operações assincronas, Await! 
*/

// * Funções Assincronas!
Future<String> tarefa({int tempo = 1}) async {
  var msg = await status(tempo);
  return 'Status: $msg';
}

Future<String> status(int tempo) {
  try {
    /* Future.error('Tempo insuficiente para o Load programado!'); */
    if (tempo < 4) throw Exception('Tempo insuficiente');
    return Future.delayed(
        Duration(seconds: tempo), () => 'Primeira Tarefa finalizada!\n');
  } catch (e) {
    print('cath: $e');
  }
  return null;
}

// * Funções Sincronas
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

Future main() async {
  contagem(segundos: 3); // Função sincrona!

  print(await tarefa(tempo: 3)); // Função Assincrona!
}
