import 'dart:collection';

//
// * Queue é uma coleção entre chaves{}, sem indexm que manipula o inicio e o fim da lista!
//
void queue(){
Queue<int> queue;
queue = Queue();
print('Implementando: ${queue.runtimeType}');
queue.addAll([20,30]);
queue.add(40);
queue.addFirst(10);
queue.addLast(50);
queue.add(60);
queue.add(null);
print(queue);

queue.removeLast();
queue.forEach((e) => print(e));

}

void main(){
  queue();
}