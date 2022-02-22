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
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/ic_launcher.png',
              scale: 5,
            ),

            //provjera rezervacije
            rezervacija
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(200),
              ),
              child: const Text('Napravite rezervaciju'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Rezervacije()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
