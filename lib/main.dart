import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class Employee {
  final String name;
  final String photoAssetPath; // Update to use asset path instead of URL

  Employee({required this.name, required this.photoAssetPath});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text('e-Sahyog'),//Today\'s Date
          // ),
          body: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Employee employee = Employee(
    name: 'Vikram Singh Yadav',
    photoAssetPath: 'images/vikram.jpg', // Update with the correct path
  );

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    return Stack(
      children: [
        // Your main content goes here
        // Positioned widget for displaying date in the top-right corner
        //Widget 1 contain date
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.white,
            child: Text(
              "Today date:" + currentDate,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 09,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        //Widget 1 contain date end
        //Widget 2 contain date start
        Positioned(
          top: 50.0,
          left: 0.0,
          right: 0.0,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(employee.photoAssetPath),
              ),
              SizedBox(height: 16.0),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                employee.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "Employee Details:",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
        )
      ],
    );
  }
}
