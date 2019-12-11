/* 
    * Conceitos
    - Generatos são funções geradoras que produzem sequencias de valores usando;
     > Funções sincronas retoram Iterable
     > Funções Assíncronas retornam Stream
*/

// * yield
//   > Utilizados em funções geradoras sincronas e assincronas
//   > Adiciona um valor ao fluxo da saída da função assincrona * retornando sem encerrar a funcão!

funcoesGeradoras(){
  Iterable<int> funcoesSincrona(int repeticaoMaxima) sync* {
    int i = 0;
    while(i < repeticaoMaxima) yield ++i;
  }
  print(funcoesSincrona(5));

  Stream<int> funcoesAssicrona(int repeticaoMaxima) async* {
    int i = 1;
    while (i < repeticaoMaxima) yield ++i;
  }

  funcoesAssicrona(3).forEach((e) => print(e));
}

// * yield
//   > Utilizados em funções geradoras sincronas e assincronas recursivas
//   > Você poderá melhorar seus desempenho usando yield* usando gerador for recursivo

funcaoGeradorasRecursivas(){

  Iterable<int> funcaoSincrona(int repeticaoMaxima) sync* {
    for (int i = 1; i <= repeticaoMaxima; i++){
      yield i;
      yield* funcaoSincrona(i - repeticaoMaxima);
    }
  }

  print(funcaoSincrona(3));

  Stream<int> funcaoAssincrona(int repeticaoMaxima) async* {
    for(int i = 1; i <= repeticaoMaxima; i++){
      yield i;
      yield* funcaoAssincrona(i - repeticaoMaxima);
    }
  }

  funcaoAssincrona(3).forEach((e) => print(e));
}

void main(){
  //funcoesGeradoras();
  funcaoGeradorasRecursivas();
}