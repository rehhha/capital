import 'package:capital/screens/ImaLiRezervaciju.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/Home.dart';
import 'PravljenjeRezervacija.dart';
import 'package:capital/services/auth.dart';
import 'dart:convert';

import 'Rezervacije.dart';

class Rezervacija extends StatefulWidget {
  const Rezervacija({Key? key}) : super(key: key);

  @override
  _RezervacijaState createState() => _RezervacijaState();
}

class _RezervacijaState extends State<Rezervacija> {
  @override
  Widget build(BuildContext context) {
    CollectionReference rezervacije =
        FirebaseFirestore.instance.collection('rezervacije');
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final uid = _auth.currentUser?.uid;
    final AuthService __auth = AuthService();

    String error = '';

    return FutureBuilder<DocumentSnapshot>(
        future: rezervacije.doc(uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            //final status = utf8.decode(data['statusRezervacije']).toString();
            return Column(
              children: [
                Text(
                    "Poštovani, ${data['ime']},\nimate rezervaciju dana ${data['datum']} u ${data['vrijeme']}.\n ",
                style: TextStyle(
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(250),
                    primary: Color.fromARGB(255,172,137,83),
                    textStyle: TextStyle(fontSize: 25),
                  ),
                  child: const Text('Home'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(250),
                    primary: Color.fromARGB(255,172,137,83),
                    textStyle: TextStyle(fontSize: 25),
                  ),
                  child: const Text('Izbriši rezervaciju'),
                  onPressed: () async {
                    dynamic result =
                    await __auth.izbrisiRezervaciju(uid!);
                    if (result == null) {
                      setState(() => error = 'Greška');
                    }
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Rezervacije()),
                          (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            );
          }
          return Text("loading");
        },
    );
  }
}
