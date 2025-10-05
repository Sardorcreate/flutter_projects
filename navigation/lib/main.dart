import 'package:flutter/material.dart';
import 'package:navigation/app_color.dart';
import 'package:navigation/container.dart';
import 'package:navigation/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext ctx) => HomePage(),
        '/profile': (BuildContext ctx) => Search(),
      },
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
        title: Text('SARDOR'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            icon: Icon(Icons.search, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_rounded, size: 30),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          ColumnBuilder(text1: "Jami hisoblangan", text2: "987 654", size1: 20, size2: 25),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  ContainersBuilder(
                    width: 160,
                    height: 85,
                    color: AppColors.mainColor,
                  ),
                  Positioned.fill(
                    top: 17,
                    child: Align(
                      alignment: Alignment.center,
                      child: ColumnBuilder(text1: "Jarayonda", text2: "234 567", size1: 15, size2: 20),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  ContainersBuilder(
                    width: 160,
                    height: 85,
                    color: AppColors.mainColor,
                  ),
                  Positioned.fill(
                    top: 17,
                    child: Align(
                      alignment: Alignment.center,
                      child: ColumnBuilder(text1: "Hamyonda", text2: "456 789", size1: 15, size2: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                ContainersBuilder(width: 250, height: 80, color: AppColors.mainColor, radius: 40,),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContainersBuilder(width: 60, height: 60,
                          color: Colors.white, radius: 30,
                          border: Colors.teal,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        ContainersBuilder(width: 60, height: 60,
                          color: Colors.white, radius: 30,
                          border: Colors.grey,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.handshake_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        ContainersBuilder(width: 60, height: 60,
                          color: Colors.white, radius: 30,
                          border: Colors.grey,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid&w=740&q=80'))
              ),
              child: Text("Menu", style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              title: Text('Men'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sen'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ben'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ten'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
