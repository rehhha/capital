import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() => runApp(Capital());

class Capital extends StatelessWidget {
  void odgovorPitanje(){
    print('Ovo je vaš odgovor');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(child: Image.asset('assets/images/ic_launcher.png',
          scale: 1.5,),
    ),
    )
    )
    );
  }
}
