import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PravljenjeRezervacija.dart';
import 'package:capital/services/auth.dart';

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
            String statusRezervacije = "${data['statusRezervacije']}";

            return Text(
                "Poštovani, ${data['ime']}, imate rezervaciju dana ${data['datum']} u ${data['vrijeme']}\n"
                    "Status rezervacije: $statusRezervacije");
          }
          return Text("loading");
        },
    );
  }
}
