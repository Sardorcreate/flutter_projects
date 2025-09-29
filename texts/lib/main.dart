import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Working with texts",
          style: TextStyle(color: Colors.greenAccent,),
        ),
      ),
      body: Center(
        child: Column(
          spacing: 25,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
                width: 200,
                height: 70,
                padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 10,
                    right: 5
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Text(
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  "Text with overflow",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      height: 1.0
                  ),
                ),
            ),
            Text.rich(
                style: TextStyle(fontSize: 25),
                TextSpan(
                  text: "Hello, ",
                  children: [
                    TextSpan(
                      text: "how ",
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TextSpan(
                      text: "are you?",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]
                ),
            ),
            Text(
              "You can select this text",
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            SelectionContainer.disabled(
              child: Text(
                "You can't select this text",
                style: TextStyle(color: Colors.green, fontSize: 22),
              ),
            ),
          ]
        ),
      ),
    );
  }
}


