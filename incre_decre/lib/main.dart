import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'functions.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Functions(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Buttons(),
      theme: ThemeData.dark(),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Functions>(
        builder: (context, Functions counter, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Increment and Decrement',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Monospace",
                    fontSize: 20
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: ListView(
              children: [
                SizedBox(height: 150),
                Center(
                  child: Text(
                    '0-filter',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Switch(
                  value: counter.switchValue,
                  onChanged: (val) {
                    counter.setSwitchValue(val);
                  },
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 50,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 50,
                      onPressed: counter.isSwapped ? counter.decrement : counter.increment,
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      iconSize: 50,
                      onPressed: counter.isSwapped ? counter.increment : counter.decrement,
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Center(
                  child: Text(
                    '${counter.count}',
                    style: TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 133),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        counter.swap();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              counter.isSwapped ? "Keys are switched!" : "Keys are back to normal!",
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        minimumSize: Size(300, 50),
                      ),
                      child: Text("Switch keys", style: TextStyle(fontSize: 35),)
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF480d75),
                      foregroundColor: Colors.white,
                      minimumSize: Size(300, 50),
                    ),
                    onPressed: counter.reset,
                    child: Text("Reset", style: TextStyle(fontSize: 35),),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}


