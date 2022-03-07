import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class PopunjavanjeForme extends StatefulWidget {
  const PopunjavanjeForme({Key? key}) : super(key: key);

  @override
  _PopunjavanjeFormeState createState() => _PopunjavanjeFormeState();
}

class _PopunjavanjeFormeState extends State<PopunjavanjeForme> {

  final AuthService _auth = AuthService();

  String? ime = '';
  String? brojTelefona = '';
  List<String> podaci = [];

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('korisnik');
    final FirebaseAuth _authh = FirebaseAuth.instance;
    final uid = _authh.currentUser?.uid;

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
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          ime = data['ime'];
          brojTelefona = data['brojTelefona'];
          podaci = [ime.toString(), brojTelefona.toString()];
          return Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'Kako se zovete?',
                  labelText: 'Ime',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                initialValue: ime,
                validator: (val) => val!.isEmpty ? 'Unesi ime' : null,
                onChanged: (val) {
                  setState(() => ime = val);
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.phone),
                    hintText: 'Vaš broj telefona?',
                    labelText: 'Broj',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  initialValue: brojTelefona,
                  validator: (val) =>
                  val!.isEmpty ? 'Unesi broj telefona' : null,
                  onChanged: (val) {
                    setState(() => brojTelefona = val);
                  },
                ),
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}
