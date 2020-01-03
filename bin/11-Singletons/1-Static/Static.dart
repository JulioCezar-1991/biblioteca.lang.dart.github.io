/* 
  *Singleton
  - É um padrão de projeto para que exista apenas uma instancoa na classe
  - O construtor nomeado privado sem o contrutor default impede a instancia de classes

  *Static
  -A instancia pode ser acessada diretamente
 */

import 'PessoaStatic.dart';

void main(){

  PessoaStatic.instancia.nome = 'Julio';
  print('${PessoaStatic.instancia.nome}\n');

  var p1 = PessoaStatic.instancia;
  p1.nome = 'Laynna';
  print(PessoaStatic.instancia.nome);

  var p2 = PessoaStatic.instancia;
  p2.nome = 'Neide';
  print(PessoaStatic.instancia.nome);
  print(identical(p1,p2)); // Compara se são iguais

}

