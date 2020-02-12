import 'dart:collection';

//
// Set é uma coleção de elementos unicos e ordenados entre {}. Não tem acesso a indice!
//

void linkedHasSet() {
  Set<int> setInt = Set();

  print('Implementotação: ${setInt.runtimeType}');
  //setInt[0] = 0; //Não tem acesso a indice

  setInt.add(12);
  setInt.add(14);
  setInt.add(15);
  setInt.add(null);
  setInt.add(34);
  setInt.remove(14);

  for (int i = 0; i < setInt.length; i++) {
    print('FOR: ${setInt.elementAt(i)}');
  }

  for (var elemento in setInt) {
    print('For in Elemento: ${elemento}');
  }

  setInt.forEach((e) => print('forEach: ${e}'));

  Set<int> listaA;
  listaA = {0, 1, 2, 3, 4};

  Set<int> listaB;
  listaB = {3, 4, 5, 6, 7};

  print(listaA.difference(listaB));
  print(listaA.union(listaB));
  print(listaA.intersection(listaB));
  print(listaA.lookup(5));
}

//
// HasSet é uma colecao de elementos unicos e desordenados
//
void hasSet() {
  HashSet<String> hashSet1;
  hashSet1 = HashSet();

  HashSet<int> hashSet2;
  hashSet2 = HashSet();

  HashSet<int> hashSet3;
  hashSet3 = HashSet();

  print('Implementotação: ${hashSet1.runtimeType}');
  hashSet1.add('A');
  hashSet1.add('B');
  hashSet1.add('C');
  hashSet1.add('D');
  hashSet1.add(null); // Pode conter null
  hashSet2.add(1); // Apenas int com 1 decimal fica ordenada
  hashSet2.add(2);
  hashSet2.add(3);
  hashSet3.add(11);
  hashSet3.add(22);
  hashSet3.add(33);
  print('$hashSet1 \n$hashSet2 \n$hashSet3');
  for (int i = 0; i < hashSet1.length; i++) {
    print('FOR: ${hashSet1.elementAt(i)}');
  }

  for (var elemento in hashSet2) {
    print('For in hashSet2: ${elemento}');
  }

  hashSet3.forEach((e) => print('forEach hashSet3: ${e}'));
}

//
// * SplaTreeSet organiza automaticamente os elementos em ordem crescente
// * Por ser uma arvore de comparacoes não pode conter elementos null
//

void splayTreeSet() {
  SplayTreeSet<String> splayTreeSet;
  splayTreeSet = SplayTreeSet();
  print('Implementotação: ${splayTreeSet.runtimeType}');
  splayTreeSet.add('info1');
  splayTreeSet.add('info4');
  splayTreeSet.add('info');
  splayTreeSet.add('info2');
  splayTreeSet.add('info5');

  print(splayTreeSet);
  for (int i = 0; i < splayTreeSet.length; i++) {
    // print(splayTreeSet[i]); //nao tem acesso a indice
    print('for: ${splayTreeSet.elementAt(i)}');
  }
  for (var elemento in splayTreeSet) {
    print('for in : $elemento');
  }
  splayTreeSet.forEach((e) => print('forEach: $e'));
}

void main() {
  linkedHasSet();
  hasSet();
  splayTreeSet();
}
