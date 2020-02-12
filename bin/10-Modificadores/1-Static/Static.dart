/* 
  * Static
  A variavel sttic fica disponivel na propria classe em vez de suas instancias/objetos
  Em metodos staticos deve ser usadas variaveis estáticas da classe
  Variaveis estáticas podem ser usadas sem instanciar a classes/objetos
*/

import 'Calculos.dart';

void main() {
  double raio = 5;
  var calculos1 = new Calculos();
  print(calculos1.pi);
  print(calculos1.areaCirculo(raio));

  print('');

  Calculos calculos2 = Calculos();
  print(calculos2.pi);
  print(calculos2.areaCirculo(raio));

  print(
      '\nInstancias consomen ${identical(calculos1, calculos2) ? 'MENOS' : 'MAIS'} memoria!\n');

  print(Calculos.piEstatico);
  print(Calculos.piEstatico * (raio * raio));
  print(
      'Retornos iguais: ${Calculos.areaCirculoEstatico(raio) == Calculos().areaCirculo(raio) ? 'SIM' : 'Não'} Metodos diferentes!');
}
