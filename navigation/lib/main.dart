import 'package:flutter/material.dart';
import 'package:navigation/app_color.dart';
import 'package:navigation/builder.dart';
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

  TextEditingController controller = TextEditingController();
  int _selectedIndex = 0;

  final List<Widget> _tabContents = [
    Container(
      color: AppColors.mainColor,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Xizmatlar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text("Hammasi",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                InkWellBuilder(text: "Soliqlarim", icon: Icons.money_outlined, onTap: () {},),
                InkWellBuilder(text: "Keshbek va imtiyozlar", icon: Icons.attach_money_outlined, onTap: () {},),
                InkWellBuilder(text: "Soliq hamkor", icon: Icons.handshake_outlined, onTap: () {},),
                InkWellBuilder(text: "Barqarorlik reytingi", icon: Icons.list, onTap: () {},),
                InkWellBuilder(text: "Mening uyim", icon: Icons.home, onTap: () {},),
                InkWellBuilder(text: "Soliq biznes", icon: Icons.cases_outlined, onTap: () {},),
                InkWellBuilder(text: "Personal xizmatlar", icon: Icons.person, onTap: () {},),
                InkWellBuilder(text: "Umumiy xizmatlar", icon: Icons.border_all_outlined, onTap: () {},),
                InkWellBuilder(text: "Mening jarimalarim", icon: Icons.done_all_outlined, onTap: () {},),
              ],
            )
          ],
        ),
      ),
    ),
    Center(child: Text("Second tab")),
    Center(child: Text("Third tab")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              InkWell(
                splashColor: Colors.transparent,
                onTap: () async {
                  String response = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text("Ishonchingiz komilmi?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Yes!'),
                            child: Text("Yes!"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'No!'),
                            child: Text("No!"),
                          ),
                        ],
                      );
                    },
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(response,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    backgroundColor: response == 'Yes!'? Colors.green : Colors.red,
                    margin: EdgeInsets.all(25),
                    duration: Duration(seconds: 2),
                  ));
                },
                child: ContainersBuilder(
                  width: 160, height: 70, color: AppColors.mainColor,
                  child: ColumnBuilder(
                    text1: "Jarayonda", text2: "234 567", size1: 15, size2: 20,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        "Hamyonda 456 789 so'm mablag' mavjud",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                      actions: [
                        TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: "Izohingizni qoldiring",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                              .showSnackBar(
                                SnackBar(
                                content: Text(
                                    "Siz ' ${controller.text} ' deb izoh qoldirdingiz!",
                                ),
                                duration: Duration(seconds: 5),
                                ),
                              );
                            controller.clear();
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.thumb_up),
                        )
                      ],
                    );
                  },
                ),
                child: ContainersBuilder(
                  width: 160, height: 70, color: AppColors.mainColor,
                  child: ColumnBuilder(
                    text1: "Hamyonda", text2: "456 789", size1: 15, size2: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Center(
            child: ContainersBuilder(
              width: 250, height: 80,
              color: AppColors.mainColor, radius: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainersBuilder(width: 60, height: 60,
                    color: Colors.white,
                    radius: 30,
                    border: _selectedIndex == 0 ? Colors.teal : Colors.grey,
                    child: IconButton(
                      onPressed: () => _onItemTapped(0),
                      icon: Icon(
                        Icons.attach_money,
                        color: _selectedIndex == 0 ? Colors.teal : Colors.grey,
                      ),
                    ),
                  ),
                  ContainersBuilder(width: 60, height: 60,
                    color: Colors.white, radius: 30,
                    border: _selectedIndex == 1 ? Colors.teal : Colors.grey,
                    child: IconButton(
                      onPressed: () => _onItemTapped(1),
                      icon: Icon(
                        Icons.handshake_outlined,
                        color: _selectedIndex == 1 ? Colors.teal : Colors.grey,
                      ),
                    ),
                  ),
                  ContainersBuilder(width: 60, height: 60,
                    color: Colors.white, radius: 30,
                    border: _selectedIndex == 2 ? Colors.teal : Colors.grey,
                    child: IconButton(
                      onPressed: () => _onItemTapped(2),
                      icon: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: _selectedIndex == 2 ? Colors.teal : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          _tabContents[_selectedIndex],
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
