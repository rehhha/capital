import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Meni.dart';

void main() => runApp(Capital());

class Capital extends StatelessWidget {
  const Capital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void naMeni(BuildContext context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Meni()));
    }

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(
                'assets/images/ic_launcher.png',
                scale: 5,
              ),
              ]
            ),
            SizedBox(
              height: 100,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dobro došli',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(150),
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
                  fixedSize: Size.fromWidth(150),
                ),
                child: const Text('Rezervacije'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Meni()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
