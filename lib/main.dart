import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mindful_task_pro/screens/Home.dart';
import 'package:mindful_task_pro/screens/MyLists.dart';
import 'package:mindful_task_pro/screens/Timer.dart';
import 'package:mindful_task_pro/screens/Calendar.dart';
import 'package:mindful_task_pro/screens/Accomplishments.dart';
import 'package:mindful_task_pro/screens/Login.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final screens = [
    Home(),
    MyLists(),
    Timer(),
    Calendar(),
  ];



  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Mindful Task Pro'),
          // Add a hamburger icon button to open the drawer
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        

        // Add a Drawer for the navigation drawer
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Menu',
                    style: TextStyle(fontSize: 28, color: Colors.white)),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  setState(() {
                    index = 0;
                    Navigator.pop(context); // Close the drawer
                  });
                },
              ),
              ListTile(
                title: Text('Accomplishment Centre'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Accomplishments()),
                  );
                },
              ),
              ListTile(
                title: Text('Login'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
              // Add more ListTile items for other sections
            ],
          ),
        ),

        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.green.shade100,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_bubble),
                label: 'My Lists',
              ),
              NavigationDestination(
                icon: Icon(Icons.timer),
                label: 'Timer',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_month),
                label: 'Calendar',
              ),
            ],
          ),
        ),
      );
 
  
}

