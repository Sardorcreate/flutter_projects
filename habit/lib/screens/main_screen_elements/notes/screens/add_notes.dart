import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/main_screen_elements/notes/screens/notes_screen.dart';
import 'package:habit/screens/main_screen_elements/notes/widgets/notes_widgets.dart';
import 'package:habit/widgets/app_bar.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key, this.existingNote});

  final NoteDM? existingNote;

  @override
  State<AddNotes> createState() => AddNotesState();
}

class AddNotesState extends State<AddNotes> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingNote != null) {
      titleController.text = widget.existingNote!.title;
      bodyController.text = widget.existingNote!.body;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBarWidget(
        title: 'Add Note',
        hasIcon: true,
        background: AppColors.secondary,
        callback: () {
          showDialog(context: context, builder: (BuildContext context) {
            return NotesWidgets.buildMoreDialogForNotes(height, context, titleController, bodyController);
          });
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 48,
                    fontWeight: FontWeight.w600
                  )
                ),
                style: TextStyle(
                  fontSize: 35,
                  height: 1.5,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: height * 0.04),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(
                    hintText: 'Type something...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600
                    )
                ),
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              )
            ],
          )
        ),
      ),
    );
  }
}