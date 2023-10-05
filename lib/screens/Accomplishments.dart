import 'package:flutter/material.dart';

class Accomplishments extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Accomplishment Centre'),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'My Accomplishments',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Level up! Your pet will level up after every 5 tasks completed.',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Text(
          'Your current pet collection is:',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Level 2 - Hootree',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Image.asset(
          'assets/images/owl2.png', // Replace with your image path
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Level 1 - Rowlet',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Image.asset(
            'assets/images/owl1.png', // Replace with your image path
          ),
        ),
      ])));
}
