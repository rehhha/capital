import 'package:capital/models/user.dart';
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
  Future registerEmailPass(String email, String pass, String ime, String prezime, String brojTelefona) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUserData(ime,prezime, brojTelefona);
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

  //rezervacija
  Future rezervacija(String ime, String brojTelefona, String brojOsoba, String datum, String vrijeme) async{
    try {
      final User? user = _auth.currentUser;
      final uid = user?.uid;
      await DatabaseService(uid: user!.uid).rezervacija(ime,brojTelefona, brojOsoba, datum, vrijeme);
      return _FromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}