import 'package:buttons/inputs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  String resultText = '';
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Working with buttons"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 25,),
                SizedBox(
                  width: 350,
                  child: Text(
                    "The button below shows what you typed as a snack bar",
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: Inputs(
                        controller: controller,
                        label: "Enter text",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("You typed: ${controller.text}")));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize:Size(100, 45)
                      ),
                      child: Text("Submit"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 375,
                  height: 1,
                  color: Colors.black54,
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: 350,
                  child: Text(
                    "The button below calculates the square of the number inside input",
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: Inputs(
                        controller: controller2,
                        label: "Enter number",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        final number = int.tryParse(controller2.text);
                        if (number != null) {
                          final result = number * number;
                          setState(() {
                            resultText = result.toString();
                          });
                        } else {
                          setState(() {
                            resultText = 'null';
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize:Size(100, 45)
                      ),
                      child: Text("Submit"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 38,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border:Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    "Result: $resultText",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 375,
                  height: 1,
                  color: Colors.black54,
                ),
                SizedBox(height: 120),
                SizedBox(
                  width: 350,
                  child: Text(
                    "Did you like this work? Rate us:",
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      child: Icon(Icons.thumb_up),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          counter--;
                        });
                      },
                      child: Icon(Icons.thumb_down),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  counter >= 0
                      ? "You liked $counter ${counter == 1 ? 'time' : 'times'}"
                      : "You disliked ${counter.abs()} ${counter.abs() == 1 ? 'time' : 'times'}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: counter >= 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }
}



