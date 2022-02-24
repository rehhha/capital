import 'package:flutter/material.dart';

class PravljenjeRezervacija extends StatefulWidget {
  const PravljenjeRezervacija({Key? key}) : super(key: key);

  @override
  State<PravljenjeRezervacija> createState() => _PravljenjeRezervacijaState();
}

class _PravljenjeRezervacijaState extends State<PravljenjeRezervacija> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Napravi rezervaciju'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Kako se zovete?',
              labelText: 'Ime',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Vaš broj telefona?',
              labelText: 'Broj',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
          Text(_dateTime.day.toString() + "."+ _dateTime.month.toString()+ "."+_dateTime.year.toString()),

          ElevatedButton(
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: _dateTime,
                    lastDate: DateTime(2100)).then((date){
                      setState(() {
                    _dateTime = date!;
                  });
                });
              },
              child: Text('Odaberite datum'),),
          Text(_timeOfDay.hour.toString() + ":"+ _timeOfDay.minute.toString()),
          ElevatedButton(
            onPressed: (){
              showTimePicker(context: context, initialTime: _timeOfDay).then((time){
                setState(() {
                  _timeOfDay = time!;
                });
              });
            },
            child: Text("Izaberi vrijeme"),),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Rezervacija za koliko osoba?',
              labelText: 'Broj osoba',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
        ],

      ),
    );
  }
}
