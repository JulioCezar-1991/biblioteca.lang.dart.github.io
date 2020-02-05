/* 
  * Singleton
  - E um padrão de projete para que esista apenas uma instância de classe.  
  - O construtor nomeado privado sem o construtor default impede de instancia a classe.

  * Getter
  - A instancia privada é acessada atraves do get.

 */

import 'PessoaGetter.dart';

void main() {
  print(PessoaGetter.instancia.nome);
  PessoaGetter.instancia.nome = 'Fernando';
  print(PessoaGetter.instancia.nome);
  var p1 = PessoaGetter.instancia;
  var p2 = PessoaGetter.instancia;

  p1.nome = 'Laynna';
  print(PessoaGetter.instancia.nome);
  p2.nome = 'Leila';
  print(PessoaGetter.instancia.nome);
  print(identical(p1, p2));
  print(p2 == PessoaGetter.instancia.nome);
}
