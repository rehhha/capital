import 'package:capital/services/auth.dart';
import 'package:capital/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:capital/models/user.dart';

import 'firebase_options.dart';
import 'screens/Rezervacije.dart';
import 'package:capital/home/Home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Capital());
}

class Capital extends StatelessWidget {
  const Capital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Korisnik?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Wrapper(),
      ),
    );
  }
}
