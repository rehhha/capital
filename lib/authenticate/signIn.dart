import 'package:capital/authenticate/register.dart';
import 'package:capital/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:capital/authenticate/authenticate.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 172, 137, 83),
        elevation: 0.0,
        title: Text('Prijavi se'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Registruj se'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/images/ic_launcher.png',
                scale: 5,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 150.0,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.email),
                          labelText: 'Email adresa',
                        ),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.password),
                          labelText: 'Lozinka',
                        ),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => pass = val);
                        },
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      ElevatedButton(
                        child: Text('Prijavi se'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(400),
                          textStyle: TextStyle(fontSize: 25),
                          primary: Color.fromARGB(255, 172, 137, 83),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _auth.signIn(email, pass);
                            if (result == null) {
                              setState(() => error = 'Greška');
                            }
                          }
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              setState(() => error = 'Greška');
                            }
                          }
                        },
                        child: Text('Prijavi se anonimno',
                            textAlign: TextAlign.center),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(400),
                          textStyle: TextStyle(fontSize: 25),
                          primary: Color.fromARGB(255, 172, 137, 83),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
