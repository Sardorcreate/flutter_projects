import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/widgets/notes_widgets.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List<dynamic>? list = [];

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        toolbarHeight: height * 0.07,
        title: Text("Notes", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            onPressed: (){
              showDialog(context: context, builder: (BuildContext context) {
                return NotesWidgets.buildDialog(height);
              });
            },
            icon: Icon(Icons.color_lens),
          ),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: (){},
            icon: Icon(Icons.grid_view),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: RawMaterialButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) {
            return NotesWidgets.buildDialog2(height);
          });
        },
        splashColor: Colors.transparent,
        fillColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35)
        ),
        elevation: 10,
        constraints: BoxConstraints.tight(Size(70, 70)),
        child: Icon(Icons.add, color: AppColors.secondary, size: 48),
      ),
      body: Builder(builder: (context){
          if (list?.isNotEmpty == true) {
            return NotesWidgets.buildGridView();
          }
          return NotesWidgets.emptyScreen();
        }
      ),
    );
  }
}
