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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Special Widgets",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
        toolbarHeight: 75,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 20,),
          Center(child: Text("Expanded", style: TextStyle(fontStyle: FontStyle.italic),),),
          Row(
            children: [
              Expanded(flex: 1, child: Container(height: 75, color: Colors.red,)),
              Expanded(flex: 2, child: Container(height: 75, color: Colors.green,)),
              Expanded(flex: 3, child: Container(height: 75, color: Colors.blue,)),
            ],
          ),
          SizedBox(height: 20,),
          Center(child: Text("Stack", style: TextStyle(fontStyle: FontStyle.italic),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    width: 105,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: 1,
                    right: 4,
                    bottom: 9,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.thumb_up),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: 0,
                    right: 0,
                    bottom: 9,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.u_turn_left_rounded),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 105,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: 4,
                    right: 1,
                    bottom: 9,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.offline_bolt_rounded),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Center(child: Text("GridView", style: TextStyle(fontStyle: FontStyle.italic),),),
          GridView(
            padding: EdgeInsets.only(bottom: 50, left: 20, right: 25),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 100,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 39,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                color: Colors.red,
                child: Text('Container №1'),
              ),
              Container(
                color: Colors.blue,
                child: Text('Container №2'),
              ),
              Container(
                color: Colors.green,
                child: Text('Container №3'),
              ),
              Container(
                color: Colors.yellow,
                child: Text('Container №4'),
              ),
            ],
          ),
          Center(child: Text("Table", style: TextStyle(fontStyle: FontStyle.italic),),),
          Table(
            border: TableBorder.all(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            textDirection: TextDirection.ltr,
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.blueGrey,),
                children: [
                  Center(child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                  Center(child: Text("Surname", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                  Center(child: Text("Age", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                ]
              ),
              TableRow(
                children: [
                  Text("Marcus"),
                  Text("Rashford"),
                  Text("27"),
                ]
              ),
              TableRow(
                children: [
                  Text("Milos"),
                  Text("Kerkez"),
                  Text("21"),
                ]
              ),
              TableRow(
                  children: [
                    Text("Rasmus"),
                    Text("Hojlund"),
                    Text("22"),
                  ]
              ),
            ],
          )
        ],
      ),
    );
  }
}
