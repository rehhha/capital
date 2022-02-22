import 'package:flutter/material.dart';

class PravljenjeRezervacija extends StatelessWidget {
  const PravljenjeRezervacija({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Napravi rezervaciju'),),
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
          return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
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
              return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Odaberite datum?',
              labelText: 'Datum',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            },
          ),



        ]
    ));
  }

}