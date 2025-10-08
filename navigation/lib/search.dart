import 'package:flutter/material.dart';
import 'package:navigation/builder.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xizmatlarni qidirish'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Ilova ichida qidiring',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Expanded(
                flex: 1, 
                child: GestureDetector(
                  onTap: () {
                    if (_controller.text != '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Siz ${_controller.text}ni qidirdingiz!",),),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Input can't be null!",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                    _controller.clear();
                  },
                  child: ContainersBuilder(
                    width: 50, height: 57,
                    color: Colors.teal, radius: 0,
                    child: Center(
                      child: Text(
                        "qidirish",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*
*TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Ilova ichida qidiring',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              ElevatedButton(onPressed: () {}, child: Text("qidirish")),
* */