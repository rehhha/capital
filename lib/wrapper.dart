import 'package:capital/home/Home.dart';
import 'package:capital/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:capital/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Korisnik?>(context);
    print(user);

    //pokazi Home ili Log in
    if(user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}
