import 'package:capital/screens/Rezervacija.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PravljenjeRezervacija.dart';
import 'package:capital/services/auth.dart';

class ImaLiRezervaciju extends StatefulWidget {
  const ImaLiRezervaciju({Key? key}) : super(key: key);

  @override
  _ImaLiRezervacijuState createState() => _ImaLiRezervacijuState();
}

class _ImaLiRezervacijuState extends State<ImaLiRezervaciju> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('korisnik');
    CollectionReference rezervacije =
        FirebaseFirestore.instance.collection('rezervacije');
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final uid = _auth.currentUser?.uid;
    var rezervacijaDaNe;

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(uid).get(),
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
          rezervacijaDaNe = data['rezervacija'];
          if (data['rezervacija'] == 'ne') {
            return Column(
              children: [
                Text('Trenutno nemate rezervaciju',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center
                  ,),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(200),
                        textStyle: TextStyle(fontSize: 25)
                      ),
                      child: const Text('Napravite rezervaciju'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PravljenjeRezervacija()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Rezervacija();
          }
        }

        return Text("loading");
      },
    );
  }
}
