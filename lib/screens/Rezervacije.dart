import 'package:capital/screens/PravljenjeRezervacija.dart';
import 'package:capital/main.dart';
import 'package:flutter/material.dart';

class Rezervacije extends StatelessWidget {
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
}
