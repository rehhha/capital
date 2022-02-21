import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Capital());

class Capital extends StatelessWidget {
  const Capital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void naMeni(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Meni()));
    }

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/ic_launcher.png',
                    scale: 5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'Dobro došli',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: const Text('Meni'),
                    onPressed: () {
                      naMeni(context);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class Home extends StatelessWidget {
  
}

class Meni extends StatelessWidget {
  const Meni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
