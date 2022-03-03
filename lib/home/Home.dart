import 'package:capital/models/user.dart';
import 'package:capital/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:capital/screens/Rezervacije.dart';
import 'package:capital/screens/Meni.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  CollectionReference users = FirebaseFirestore.instance.collection('korisnik');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,248,251,255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,172,137,83),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/bcg.png"),
    fit: BoxFit.cover,
    ),),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,

              //width: double.infinity,
              //height: double.infinity,
              children: <Widget>[
                const Text(
                  'Dobro došli u',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Capital Bars& Restaurants',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Color.fromARGB(255,172,137,83),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(250),
                      primary: Color.fromARGB(255,172,137,83),
                      textStyle: TextStyle(fontSize: 25),
                    ),
                    child: const Text('Meni'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Meni()),
                      );
                    },
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(250),
                      primary: Color.fromARGB(255,172,137,83),
                      textStyle: TextStyle(fontSize: 25),
                    ),
                    child: const Text('Rezervacije'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Rezervacije()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
