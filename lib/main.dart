/*
Sarthak@2023
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'R2E Location Tracker',
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           titleTextStyle: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'R2E Location Tracker',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 16.0),
          bodyText2: TextStyle(fontSize: 16.0),
          headline6: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nodeIdController = TextEditingController();

  String location1Date = '';
  String location1Time = '';
  String location2Date = '';
  String location2Time = '';
  String location1Value = ''; // Added for Location 1 value
  String location2Value = ''; // Added for Location 2 value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/r2e.gif',  // Update with your actual image path
              height: 90.0,
              width: 90.0,
              // Add any additional styling here
            ),
            SizedBox(width: 8.0),
            Text('R2E Location Tracker'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Enter your name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: nodeIdController,
                decoration: InputDecoration(labelText: 'Enter your Node ID'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your Node ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform the submission logic
                    setState(() {
                      location1Date = '2023-01-01';
                      location1Time = '12:00 PM';
                      location2Date = '2023-01-02';
                      location2Time = '03:30 PM';
                      location1Value = 'Kheerganga';
                      location2Value = 'Kasol';
                    });
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 32.0),
              Text('Location 1: $location1Value'),
              Text('Date: $location1Date'),
              Text('Time: $location1Time'),
              // Displaying Location 1 value
              SizedBox(height: 16.0),
              Text('Location 2: $location2Value'),
              Text('Date: $location2Date'),
              Text('Time: $location2Time'),
              // Displaying Location 2 value
            ],
          ),
        ),
      ),
    );
  }
}
