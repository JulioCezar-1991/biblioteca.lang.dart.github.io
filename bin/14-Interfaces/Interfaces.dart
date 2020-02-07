/* 
  * Conceito
  - Interfaces são modelos para implementar metodos e atributos em nossas classes.  

  * Regras 
  - Ao implementar uma iterface devemos utilizar todos os metodos em atributos 
  - No dart não tem sintaxe para interfaces, pode ser uma classe concreta ou abstrata! 
  - Pode implementar mais de uma interface e deve sobrescrever todos metodos e atributos!

 */

import 'Candidato.dart';

void main() {
  var bolsonaro = Candidato('Bolsonaro', ideologia: 'Direita', partido: 'PSL');
  bolsonaro
    ..objetivo = 'Ganhar eleição'
    ..objetivosPessoais()
    ..postagem = 'Acabar com a corrupção no Brasil'
    ..escreverPostagem()
    ..ideologiaPolitica();
}
