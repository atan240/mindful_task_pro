// import 'package:flutter/material.dart';

// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Login Page'),
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:mindful_task_pro/screens/Home.dart';
import 'package:mindful_task_pro/screens/Navigation.dart';

void main() {
  runApp(MaterialApp(home: Login()));
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              const SizedBox(height: 10),
              const Text(
                'MINDFUL TASK PRO',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'FOCUS FOR SUCCESS',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter email to login or register',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Checkbox(
                        value: true,
                        onChanged: null,
                      ),
                      Text('Remember me'),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => MyApp(),
                              ),
                            );
                          },
                          child: Text('SIGN UP OR LOG IN'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen[500],
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: DropdownButton<String>(
                      items:
                          ['English', 'Spanish', 'French'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                      value: 'English',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
