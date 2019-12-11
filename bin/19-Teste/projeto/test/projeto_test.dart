import 'package:projeto/projeto.dart';
import 'package:test/test.dart';

void main() {
  //TESTES VARIAVEIS
  test('Converter Strings em Array', () {
    String texto;
    texto = 'Julio,Laynna,Neide';
    expect(texto.split(','), equals(['Julio', 'Laynna', 'Neide']));
  });

  // TESTES FUNÇOES
  test('calculate', () => expect(calculate(), 42));

  group('Manupulacao de String', () {
    test(
        'ConverterEmLista',
        () => expect(
            converterEmLista('Leila Martins'), equals(['Leila', 'Martins'])));
    test(
        'Recuperar Nome',
        () => expect(
            recuperarNome(['Fernando', 'Martins']),
            allOf(
                contains('nando'), isNot(startsWith('Lei')), endsWith('ndo'))));
  });

  group('Manipulação de int', () {
    test('Verificar Maiorirade', () {
      expect(maioridade(18), 'Adulto');
      expect(maioridade(17), 'Adolecente');
      expect(maioridade(13), 'Criança');
    });
    test('Resto da divisão', () => expect(restoDivisao(12, 3), equals(0)));
  });
}
