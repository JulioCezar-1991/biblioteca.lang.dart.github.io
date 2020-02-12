
class Animal {
  String idade;
  bool docil;

  Animal(this.idade, {this.docil = false}) {
    // docil ??= false;  //Não se deve fazer tratamendo nas classes modelos
  }

  void dormir() {
    print('Dorme como um animal!');
  }
}
