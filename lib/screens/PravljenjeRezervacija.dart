import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:capital/services/database.dart';
import 'package:capital/services/auth.dart';
import 'package:intl/intl.dart';
import 'Rezervacije.dart';

class PravljenjeRezervacija extends StatefulWidget {
  const PravljenjeRezervacija({Key? key}) : super(key: key);

  @override
  State<PravljenjeRezervacija> createState() => _PravljenjeRezervacijaState();
}

class _PravljenjeRezervacijaState extends State<PravljenjeRezervacija> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String ime = '';
  String brojTelefona = '';
  String brojOsoba = '';
  String datum = '';
  String vrijeme = '';
  String error = '';

  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.Hm();  //"6:00 AM"
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Napravi rezervaciju'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Rezervišite stol',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                    hintText: 'Kako se zovete?',
                    labelText: 'Ime',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (val) => val!.isEmpty ? 'Unesi ime' : null,
                  onChanged: (val) {
                    setState(() => ime = val);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone),
                      hintText: 'Vaš broj telefona?',
                      labelText: 'Broj',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (val) => val!.isEmpty ? 'Unesi broj telefona' : null,
                    onChanged: (val) {
                      setState(() => brojTelefona = val);
                    },
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                    hintText: 'Rezervacija za koliko osoba?',
                    labelText: 'Broj osoba',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (val) => val!.isEmpty ? 'Unesi broj osoba' : null,
                  onChanged: (val) {
                    setState(() => brojOsoba = val);
                  },
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                      _dateTime.day.toString() +
                          "." +
                          _dateTime.month.toString() +
                          "." +
                          _dateTime.year.toString(),
                      style: const TextStyle(
                        fontSize: 25,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 70, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: _dateTime,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100))
                            .then((date) {
                          setState(() {
                            _dateTime = date!;
                            datum = DateFormat('dd-MM-yyyy').format(_dateTime);
                          });
                        });
                      },
                      child: Icon(Icons.calendar_today),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                      _timeOfDay.hour.toString() +
                          ":" +
                          _timeOfDay.minute.toString(),
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 70, 10),
                    child: ElevatedButton(
                      onPressed: () {
                        showTimePicker(
                                context: context, initialTime: _timeOfDay)
                            .then((time) {
                          setState(() {
                            _timeOfDay = time!;
                            vrijeme = formatTimeOfDay(_timeOfDay);
                          });
                        });
                      },
                      child: Icon(Icons.query_builder),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Pravljenje rezervacije"),
                        ),
                      );
                      dynamic result = await _auth.rezervacija(
                          ime, brojTelefona, brojOsoba, datum, vrijeme);
                      if (result == null) {
                        setState(() => error = 'Pokušajte ponovo');
                      }
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Rezervacije()),
                            (Route<dynamic> route) => false,
                      );
                    }
                  },
                  child: Text('Napravi rezervaciju'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
