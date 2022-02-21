import 'package:flutter/material.dart';

class Meni extends StatelessWidget {
  const Meni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meni'),
      ),
      body: Center(
        child: Column(
          children: const [
            Card(
              child: Image(
                image: AssetImage('assets/images/meni-01.png'),
              )
            ),
          ],
        ),
      ),
    );
  }
}
