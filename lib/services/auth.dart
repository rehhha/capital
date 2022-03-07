import 'package:capital/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';
import 'package:flutter/cupertino.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //kreiranje user obj na osnovu FirebaseUsera
  Korisnik? _FromFirebaseUser(User? user){
    return user != null ? Korisnik(uid: user.uid) : null;
  }

  Stream<Korisnik?> get user{
    return _auth.authStateChanges()
        .map(_FromFirebaseUser);
  }

  //anonimni sign in
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _FromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in
  Future signIn(String email, String pass) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      return _FromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //registracija
  Future registerEmailPass(String email, String pass, String ime, String prezime, String brojTelefona, String rezervacija) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUserData(ime,prezime, brojTelefona, rezervacija);
      return _FromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //logout
  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //mijenjanje korisničkih podataka
  Future promjenaKorisnickihPodataka(String? ime, String? prezime, String? brojTelefona, String? rezervacija) async{
    try {
      final User? user = _auth.currentUser;
      final uid = user?.uid;
      await DatabaseService(uid: user!.uid).updateUserData(ime,prezime, brojTelefona, rezervacija);
      return _FromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //rezervacija
  Future rezervacija(String? ime, String? brojTelefona, String? brojOsoba, String? datum, String? vrijeme,String? napomena) async{
    try {
      final User? user = _auth.currentUser;
      final uid = user?.uid;
      await DatabaseService(uid: user!.uid).rezervacija(ime,brojTelefona, brojOsoba, datum, vrijeme,napomena);
      return _FromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  CollectionReference rezervacije = FirebaseFirestore.instance.collection('rezervacije');

  Future izbrisiRezervaciju(String uid) {
    updateUser(uid);
    return rezervacije
        .doc(uid)
        .delete()
        .then((value) => print("Rezervacija izbrisana"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  CollectionReference users = FirebaseFirestore.instance.collection('korisnik');

  Future<void> updateUser(String uid) {
    return users
        .doc(uid)
        .update({'rezervacija': 'ne'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  //preuzimanje podataka
  /*Future uzmiIme(){
    final User? user = _auth.currentUser;
    final uid = user?.uid;


  }
*/


}