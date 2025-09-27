import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Working with icons"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.radar_rounded,
                  color: Colors.red,
                  size: 70,
                ),
                Icon(
                  Icons.alarm_on,
                  color: Colors.green,
                  size: 70,
                ),
                Icon(
                  Icons.pages,
                  color: Colors.black54,
                  size: 70,
                ),
                Icon(
                  Icons.umbrella_rounded,
                  color: Colors.teal,
                  size: 70,
                ),
              ],
            ),
            SizedBox(height: 50),
            Column(
              spacing: 50,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.hail_rounded,
                      color: Colors.grey,
                      size: 70,
                    ),
                    Icon(
                      Icons.gamepad_rounded,
                      color: Colors.redAccent,
                      size: 70,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.face,
                      color: Colors.orangeAccent,
                      size: 70,
                    ),
                    Icon(
                      Icons.backpack,
                      color: Colors.deepPurpleAccent,
                      size: 70,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.radar_rounded,
                  color: Colors.red,
                  size: 70,
                ),
                Icon(
                  Icons.alarm_on,
                  color: Colors.green,
                  size: 70,
                ),
                Icon(
                  Icons.pages,
                  color: Colors.black54,
                  size: 70,
                ),
                Icon(
                  Icons.umbrella_rounded,
                  color: Colors.teal,
                  size: 70,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
