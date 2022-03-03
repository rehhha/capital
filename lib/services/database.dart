import 'package:capital/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference korisnikCollection =
      FirebaseFirestore.instance.collection('korisnik');
  final CollectionReference rezervacijeCollection =
      FirebaseFirestore.instance.collection('rezervacije');

  Future<void> updateUserData(
      String ime, String prezime, String brojTelefona, String rezervacija) async {
    return await korisnikCollection.doc(uid).set(
      {
        'ime': ime,
        'prezime': prezime,
        'brojTelefona': brojTelefona,
        'rezervacija' : rezervacija
      },
    );
  }

  Future<void> rezervacijaDa(String rezervacija) async {
    return await korisnikCollection.doc(uid).set(
      {
        'rezervacija' : rezervacija
      },
    );
  }

  Stream<QuerySnapshot> get korisnik {
    return korisnikCollection.snapshots();
  }

  Stream<QuerySnapshot> get rezervacije {
    return rezervacijeCollection.snapshots();
  }

  Korisnik _korisnik(DocumentSnapshot snapshot) {
    return Korisnik(
      uid: this.uid,
      ime: snapshot['ime'],
      prezime: snapshot['prezime'],
      brojTelefona: snapshot['brojTelefona'],
      rezervacija: snapshot['rezervacija'],

    );
  }

  //snapshot informacija o korisniku
  Stream<Korisnik> get korisnikInfo {
    return korisnikCollection.doc(uid).snapshots().map(_korisnik);
  }



  Future<void> rezervacija(
      String ime, String brojTelefona, String brojOsoba, String datum, String vrijeme, String napomena, String statusRezervacije) async {
    return await rezervacijeCollection.doc(uid).set({
      'ime': ime,
      'brojTelefona': brojTelefona,
      'brojOsoba' : brojOsoba,
      'datum' : datum,
      'vrijeme' : vrijeme,
      'napomena' : napomena,
      'statusRezervacije' : statusRezervacije
    });
  }
}
