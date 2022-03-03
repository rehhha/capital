import 'package:capital/screens/PravljenjeRezervacija.dart';
import 'package:capital/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:capital/services/database.dart';
import 'package:capital/models/user.dart';
import 'package:capital/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:capital/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ImaLiRezervaciju.dart';

class Rezervacije extends StatefulWidget {
  const Rezervacije({Key? key}) : super(key: key);

  @override
  _RezervacijeState createState() => _RezervacijeState();
}

class _RezervacijeState extends State<Rezervacije> {
  /*final FirebaseAuth _auth = FirebaseAuth.instance;

  late final User? user = _auth.currentUser;
  late final uid = user?.uid;*/

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('korisnik');
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("Rezervacije"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 172, 137, 83),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 150.0,
                  ),

                  Image.asset(
                    'assets/images/ic_launcher.png',
                    scale: 6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Upravljajte rezervacijama u ',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    'Capital Bars & Restaurants',
                    style:TextStyle(
                      color: Color.fromARGB(255, 172, 137, 83),
                      fontSize: 25,
                    )
                  ),
                  SizedBox(
                    height: 150.0,
                  ),
                  ImaLiRezervaciju(),
                ],
              ),
            ),
          ),
        ));
  }
}

/*class Rezervacije extends StatelessWidget {
  const Rezervacije({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rezervacije'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/ic_launcher.png',
              scale: 5,
            ),
            SizedBox(
              height: 380,
            ),
            Container(
              //provjera rezervacije
              child: rezervacija
                  ? Text(
                      'Trenutno imate rezervaciju',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                      ),
                    )
                  : Text(
                      'Trenutno nemate rezervaciju',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                      ),
                    ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(200),
                  ),
                  child: const Text('Napravite rezervaciju'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PravljenjeRezervacija()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
