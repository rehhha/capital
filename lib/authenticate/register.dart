import 'package:capital/screens/Rezervacije.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:capital/models/user.dart';
import '../services/auth.dart';
import 'authenticate.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _authh = FirebaseAuth.instance;

  String email = '';
  String pass = '';
  String ime = '';
  String prezime = '';
  String brojTelefona = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        title: Text('Registruj se'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Prijavi se'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                    labelText: 'Ime',
                  ),
                  validator: (val) => val!.isEmpty ? 'Unesi ime' : null,
                  onChanged: (val) {
                    setState(() => ime = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                    labelText: 'Prezime',
                  ),
                  validator: (val) => val!.isEmpty ? 'Unesi prezime' : null,
                  onChanged: (val) {
                    setState(() => prezime = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.phone),
                    labelText: 'Broj telefona',
                  ),
                  validator: (val) => val!.isEmpty ? 'Unesi broj telefona' : null,
                  onChanged: (val) {
                    setState(() => brojTelefona = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email),
                    labelText: 'Email adresa',
                  ),
                  validator: (val) => val!.isEmpty ? 'Unesi email' : null,
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
                  validator: (val) => val!.length < 6
                      ? 'Lozinka mora imati najmanje 6 znakova'
                      : null,
                  onChanged: (val) {
                    setState(() => pass = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.blue[400],
                  child: Text(
                    'Registruj se',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result =
                          await _auth.registerEmailPass(email, pass, ime, prezime, brojTelefona, 'ne');
                      if (result == null) {
                        setState(() => error = 'Upiši ispravan email');
                      }

                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
