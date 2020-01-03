/* Tratamento de Excecao!
  -try: Usado para testar uma lógica.
  - catch: Captura erros na lógica try.
  - on: captura especificas/conlhecidas na lógica try.
  - throw Exception: Excecao criada pelo usuario e tratada no catch.
  - finally: Executado ao final try/catch. com exceção ou não! Utilizado recursos na lógica try
 */

//
// CASO1: Quando voce desconhece a excecao, use a clausula TRY CATCH
//

int resultado;
double resultadoDouble;
int valorA = 1, valorB = 0;

void caso1() {
  try {
    resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } catch (e) {
    print('Execao: $e');
  }
}

//
// CASO2: Quando você conhece a execao, use a clausula ON
//

void caso2() {
  try {
    resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } on IntegerDivisionByZeroException {
    print('Excecao: Não é possivel divider por zero!');
  } catch (e) {
    print('Execao: $e');
  }
}

//
// CASO3: Para descobrir ocorridos antes da excecao 'Historico', use Stack Trace,
//

void caso3() {
  try {
    resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  }  catch (e, s) {
    print('Execao: $e');
    print('Stack Trace: $s');
  }
}

//
// CASO4: Use finally para tratamentos apos axecusao do Try Cath,
//

void caso4() {
  try {
    resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  }  catch (e) {
    print('Execao: $e');
  } finally {
    print('finally: Com ou sem excecao "finally" sera executado!');
  }
}

//
// CASO5: Use throw Exception para lança uma exception,
//

void caso5() {
  try {
    
    resultadoDouble = valorA / valorB;
    print('Resultado: $resultadoDouble');
    if(resultadoDouble.isInfinite) throw Exception('A variavel valorB deve ser =! 0');
    
    
  }  catch (e) {
    print('Execao: $e');
  } finally {
    print('finally: Com ou sem excecao "finally" sera executado!');
  }
}

void main() {
  caso1();
  caso2();
  caso3();
  caso4();
  caso5();
}
