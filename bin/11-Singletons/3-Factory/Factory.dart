/* 
  * Singleton
  - E um padrão de projeto para que exista apenas uma instãncia da classe.
  - O Construtor nomeado privado sem o construtor default impede de instancia a classe.  
  * Factory
  - Construtor factory é usado para retornar/manter a instancia original. 
  - Construtor factory é capaz de retornar valores.

 */
import 'PessoaFactory.dart';

void singletonFactory() {
  print('\n11.4) Singleton Instancia\n');
  var p1 = PessoaFactory();
  print(p1.nome);
  p1.nome = 'Fernando';
  print(PessoaFactory.instancia.nome);
  PessoaFactory.instancia.nome = 'Leila';
  print(p1.nome);
  var p2 = PessoaFactory();
  p2.nome = 'Chloe';
  print(PessoaFactory.instancia.nome);
  print(identical(p1, PessoaFactory.instancia));
  print(p2 == PessoaFactory.instancia);
}

void singletonInstancia() {
  print('\n11.4) Singleton Instancia\n');

  var p1 = PessoaInstancia(nome: 'Julio Cezar');
  print('nome: ${p1.nome} id: ${p1.identidade}');
  var p2 = PessoaInstancia(nome: 'Leila', identidade: 12345678);
  print('nome: ${p2.nome} id: ${p2.identidade}');
  print(identical(p1, p2));
  print(p2 == PessoaInstancia.instancia);
}

void main() {
  singletonInstancia();
}
