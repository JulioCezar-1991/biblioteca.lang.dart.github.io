/* 
  * Const
  - Inicializada em tempo de compilação, deve ser declarada com o valor constante
  - Ao nível de classes deve ser statica para ficar disponivel na classe
  - Em cleçoes const todo o conteudo deve ser contante
  
  * Objeto imutavel
  - O construtor deve ser constatante
  - As variaveis devem ser final ou static const
  
   */

void main() {
  const pi = 3.14;
  double raio = 2;
  var resultado = pi * (raio * raio);
  print('${resultado}\n');

  // Um array final pode ser alterado.
  final numeros = [raio, 2.5];
  numeros.add(resultado);
  print('$numeros\n');

  final dynamic listaFinal = const [0, 1];
  // listaFinal.add(2);
  print('$listaFinal\n');

  const listaConst = [1, 2, pi];
  // listaConst.add(pi);
  print('${listaConst}\n');

  for (var i = 0; i < 3; i++) {
    final indiceFinal = i;
    const constante = 2;
    print('contagem: ${constante + indiceFinal}');
  }
  var pais = new Brasil(-15.654654, 47.2343432);
  print(
      '\n ojeto: $pais capital: ${Brasil.capital}  latitude: ${pais.latitude} longtide: ${pais.longitude}');
  print('Estados: ${Brasil.estados}');
}

class Brasil {
  final double latitude;
  final double longitude;
  static const String capital = 'Brasilia';
  static const estados = ['GO, TO, MT, MS'];

  const Brasil(this.latitude, this.longitude);
}
