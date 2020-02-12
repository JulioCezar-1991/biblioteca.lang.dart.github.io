/* 
  * Final
  Inicializada apenas quando acessada em tempo de execução, deve ser declarada
  Em colecoes final nem todo o conteúdo será final
  */

import 'Pessoa.dart';

void main() {
  //? Objeto em queda livre leva 5s para chegar ao solo! Qul a velocidade maxima do objeo?

  final gravidade = 9.8;
  int tempo = 5;
  double velocidade = gravidade * tempo;
  print('Velocidade maxima: $velocidade ms\n');

  for (int i = 1; i <= 3; i++) {
    final indice = i;
    print('contagem: $indice');
  }

  var pessoa = Pessoa('Fernanda', ['Leila', 'Gaby']);
  pessoa.name = 'Fernanda Gomes';
  //pessoa.familiares = []; //error: atributo final
  print('Nome: ${pessoa.name} familiares: ${pessoa.familiares}');
}
