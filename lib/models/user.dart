class Korisnik {

  final String uid;
  String ime = '';
  String brojTelefona = '';
  Korisnik ({ required this.uid });

  void postaviIme(String? unos){
    ime = unos!;
  }

  String uzmiIme(){
    return ime;
  }

}