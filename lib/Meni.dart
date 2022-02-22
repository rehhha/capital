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
        child: ListView(
          children: [Image.asset('assets/images/meni-01.png'), Image.asset('assets/images/meni-02.png'), Image.asset('assets/images/meni-03.png'),
            Image.asset('assets/images/meni-04.png'), Image.asset('assets/images/meni-05.png'), Image.asset('assets/images/meni-06.png'),
            Image.asset('assets/images/meni-07.png'), Image.asset('assets/images/meni-08.png'), Image.asset('assets/images/meni-09.png'),
            Image.asset('assets/images/meni-10.png'), Image.asset('assets/images/meni-11.png'), Image.asset('assets/images/meni-12.png'),
            Image.asset('assets/images/meni-13.png'), Image.asset('assets/images/meni-14.png'), Image.asset('assets/images/meni-15.png'),
            Image.asset('assets/images/meni-16.png'), Image.asset('assets/images/meni-17.png'), Image.asset('assets/images/meni-18.png'),
            Image.asset('assets/images/meni-19.png'), Image.asset('assets/images/meni-20.png'), Image.asset('assets/images/meni-21.png'),
            Image.asset('assets/images/meni-22.png'), Image.asset('assets/images/meni-23.png'), Image.asset('assets/images/meni-24.png'),
            Image.asset('assets/images/meni-25.png'), Image.asset('assets/images/meni-26.png'), Image.asset('assets/images/meni-27.png'),
            Image.asset('assets/images/meni-28.png'),],
        )
      ),
    );
  }
}
