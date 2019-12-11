import 'dart:async';

/* 
  * Conceito:
  Stream é uma fora de monitorar eventos. Ao adicionar eventos na stream os ouvintes serão notificados!
    > As streams fornecem uma sequência assíncrona de dados. Para processar uma stream use await() ou listen(). 
    > Exixtem doís tipos de stream: assinatura única(subscription) ou transmissão(broadcast).  
    > Stream é uma sequencia com varios Futures! Ao invez de obter um evento solicitado(Future), a stream informa que há umaevento quando está pronto.
    
  * stream
  - Fluxo que a classe streamController() esta gerenciando.  

  * add()
  - Adiciona eventos na stream notificando os ouvintes que estão monitorando!

  *listen()
  - Inscreve um ouvinte na stream notificações de eventos.  
   > onData: Notifica o assinante com eventos de dados da stream, se for nulo, nada acontece.  
   > onError: Tratamento de evnetos com erro e possível rastreamento Stack Trace. Se omitido erros serão considerados exceptions!
   > onDone: evento quando a stream é fechado.   
   > cancelOnError: A assinatura é cancelada automaticamentr ao receber um evento erro!
 */

//
// * CONCEITO
//

void conceito() {
  var lista = List<dynamic>();

  //1) controller
  var controlador = StreamController<dynamic>();

  //2) stream
  var stream = controlador.stream;

  //3) incricao de ouvintes na stream
  stream.listen((onData) {
    lista.add(onData);
  }, onDone: () {
    print('Stream finalizada');
    print(lista);
  });

  //4) adicionar um evneto a stream
  controlador.sink.add('Julio');
  controlador.sink.add(36);
  controlador.sink.add(1.85);
  controlador.sink.add(!false);
  controlador.close();

  print('Monitorando...');
}

//
// * MODEL
//

class Contador {
  var _contagem = 1, termino, erro;
  final _controlador = StreamController<int>();

  Sink<int> get sink =>
      _controlador.sink; // não expor o controlador as interfaces
  Stream<int> get stream => _controlador.stream;

  Contador({this.termino, this.erro = 3}) {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _contagem < termino ? sink.add(_contagem) : sink.close();
      _contagem++;
      if (_contagem == erro) _controlador.addError('Erro intencional');
      if (_contagem > termino) timer.cancel();
    });
  }
}

void model() {
  //stream
  var minhaStream = Contador(termino: 7, erro: 3)
      .stream
      .asBroadcastStream(); //asBroadcastStream: Permite criar mais de 1 ouvinte

  //inscricao de ouvintes na stream
  final inscrito1 = minhaStream.listen(
      (onData) {
        print('Inscrito1: $onData');
      },
      onError: (erro) {
        print('Inscrito1: $erro');
      },
      cancelOnError: false,
      onDone: () {
        print('Inscrito1 Completo');
      });

  var pares = (e) => e % 2 == 0;
  var mapear = (e) => '$e é par';

  // Modificar evento
  final inscrito2 = minhaStream.where(pares).map(mapear).listen(
      (onData) {
        print('Inscrito2: $onData');
      },
      onError: (erro) {
        print('Inscrito2: $erro');
      },
      cancelOnError: false,
      onDone: () {
        print('Inscrito2 Completo');
      });

// Gerenciar inscritos
  for (var i = 1; i <= 6; i++) {
    Future.delayed(Duration(seconds: i), () {
      if(i == 1) inscrito1.pause();
      if(i == 3) inscrito1.resume();
      if(i == 4) inscrito1.cancel();
    });
  }
}

//
// * METODO
//

Future metodos() async {

  var stream = Stream<dynamic>.periodic(Duration(seconds: 1), (e) => e +1).take(5).asBroadcastStream();
  stream = stream.takeWhile((e) => e <= 5).skipWhile((e)=> e > 3).take(3).map((e) => e.toString().padLeft(2, '00'));

  // ouvintes
  stream.listen((onData){
    print('listen: $onData');
  }, onDone: (){
    print('Contagem finalizada');
  });

/*   stream.forEach((e) => print('forEach: $e')); */

/*   await for(dynamic evento in stream){
        print('forIn: $evento');
  }
*/

 /*  List<dynamic> eventos = await stream.toList();
        print(eventos);
 */

Future<List<dynamic>> eventosFuturos = stream.toList();
print(await eventosFuturos);

}

void main() {
  //conceito();
  //model();
  metodos();
}
