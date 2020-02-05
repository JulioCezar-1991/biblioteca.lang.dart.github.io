/* 
<<<<<<< HEAD
  * Singleton
  - E um padrão de projeto que exista apenas uma instãcia da classe.
  - O contrutor nomeado privado sem construtor default impede de instanciar a classe.
  * Static
  -A instancia pode ser acessada diretamente. 
*/

import 'PessoaStatic.dart';

void main() {
  print(PessoaStatic.instancia.nome);
  PessoaStatic.instancia.nome = 'Julio';
  print(PessoaStatic.instancia.nome);
  var p1 = PessoaStatic.instancia;
  p1.nome = 'Leila';
  print(p1.nome);
  var p2 = PessoaStatic.instancia;
  p2.nome = 'Laynna';

  print(p2.nome);
  print(identical(p1, p2));
  print(p2 == PessoaStatic.instancia);
}
=======
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

>>>>>>> f643af1f133770980410c9cbc280fac30361d5f4
