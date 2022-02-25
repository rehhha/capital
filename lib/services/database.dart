import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference korisnikCollection =
      FirebaseFirestore.instance.collection('korisnik');
  final CollectionReference rezervacijeCollection =
      FirebaseFirestore.instance.collection('rezervacije');

  Future<void> updateUserData(
      String ime, String prezime, String brojTelefona) async {
    return await korisnikCollection.doc(uid).set(
      {
        'ime': ime,
        'prezime': prezime,
        'brojTelefona': brojTelefona,
      },
    );
  }

  Stream<QuerySnapshot> get korisnik {
    return korisnikCollection.snapshots();
  }

  Future<void> rezervacija(
      String ime, String brojTelefona, String brojOsoba, String datum, String vrijeme) async {
    return await rezervacijeCollection.doc(uid).set({
      'ime': ime,
      'brojTelefona': brojTelefona,
      'brojOsoba' : brojOsoba,
      'datum' : datum,
      'vrijeme' : vrijeme
    });
  }
}
