/* 
  * Regras
  - Uma classe pode ter apenas uma herança

  * Contrutores
  - Devem obedecer a ordem dos paramentros
  - Parametros default devem ser nomeados ou posicionados
  - Tratamento e tipagem de parametros devem ser feito na classe herdaira
 */

import 'Cao.dart';

void main() {
  var cao = Cao('Chloe', 'Pug', 'Femea');
  cao.docil = true;

  print(
      'Nome: ${cao.nome} | Raca: ${cao.raca} | Sexo: ${cao.sexo} | Idade: ${cao.idade} | Docil: ${cao.docil}');
  cao
    ..dormir()
    ..alimentar()
    ..acao();
  print('${cao.nome} ${cao.docil ? 'é docil.' : 'não é docil.'}');
}
