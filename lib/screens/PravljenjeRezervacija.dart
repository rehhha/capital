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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
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
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
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
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @  char.'
                    : null;
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(_dateTime.day.toString() + "."+ _dateTime.month.toString()+ "."+_dateTime.year.toString(),
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
                        lastDate: DateTime(2100)).then((date){
                          setState(() {
                        _dateTime = date!;
                      });
                    });
                  },
                  child: Icon(Icons.calendar_today),),
            ),]),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    Text(
                        _timeOfDay.hour.toString() + ":"+ _timeOfDay.minute.toString(),
                        style: TextStyle(
                          fontSize: 25,
                        )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 70, 10),
              child: ElevatedButton(
                onPressed: (){
                  showTimePicker(context: context, initialTime: _timeOfDay).then((time){
                    setState(() {
                      _timeOfDay = time!;
                    });
                  });
                },
                child: Icon(Icons.query_builder),),
            ),]),

            const SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Pravljenje rezervacije"),
              ));

            }, child: Text('Napravi rezervaciju'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200,50),
              ),

            )

          ],

        ),
      ),
    );
  }
}
