import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Capital());

class Capital extends StatelessWidget {
  void odgovorPitanje() {
    print('Ovo je vaš odgovor');
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 20,),
              Container(
                child: Text('Dobro došli',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                ),),
              ),
            ],
          )
        ),
      ),
    );
  }
}
