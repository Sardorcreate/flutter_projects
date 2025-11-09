import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/core/storage/notes_storage.dart';
import 'package:habit/core/storage/todos_storage.dart';

import '../screens/notes_screen.dart';

class NotesWidgets {
  static List<Color>? colors = [
    AppColors.secondary,
    AppColors.colour1,
    AppColors.primary,
    AppColors.colour2,
    AppColors.colour4,
    AppColors.colour3,
    AppColors.colour5,
    AppColors.colour6,
    AppColors.colour7,
    AppColors.colour10,
    AppColors.colour8,
    AppColors.background,
  ];

  static Widget emptyScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/rafiki.svg"),
          SizedBox(height: 20),
          Text("Create your first note !", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  static Widget buildDialog(double height, BuildContext context) {

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(29),
        height: height * 0.54,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filter by colour", style: TextStyle(fontSize: 24)),
            SizedBox(height: height * 0.04),
            GestureDetector(
              onTap: () async {
                final notesList = await NotesLocalStorage.loadNotes();
                final todosList = await TodosLocalStorage.loadTodos();
                final list = [...notesList, ...todosList];
                Navigator.pop(context, list);
              },
              child: _buildContainer(
                AppColors.secondary,
                child: Text("Reset", style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: height * 0.03,
                  childAspectRatio: 2.5,
                ),
                itemCount: colors?.length ?? 0,
                itemBuilder: (context, index) {
                  final color = colors![index];
                  return GestureDetector(
                    onTap: () async {
                      final notesList = await NotesLocalStorage.loadNotes();
                      final todosList = await TodosLocalStorage.loadTodos();

                      print(notesList.toList());
                      print(todosList.toList());

                      final list = [
                        ...notesList.where((n) => n.backColor == color),
                        ...todosList.where((t) => t.backColor == color),
                      ];

                      print(list.toList());

                      Navigator.pop(context, list);
                    },
                    child: _buildContainer(color),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildAddDialog(
    BuildContext context,
    double height,
    VoidCallback callback1,
    VoidCallback callback2,
    String text1,
    String text2,
    IconData icon1,
    IconData icon2,
  ) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: height * 0.05, vertical: 10),
        height: height * 0.18,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "New",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            InkWell(
              onTap: callback1,
              child: Row(
                spacing: 20,
                children: [
                  Icon(icon1, size: 36),
                  Text(text1, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: callback2,
              child: Row(
                spacing: 20,
                children: [
                  Icon(icon2, size: 36),
                  Text(text2, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildContainer(Color color, {Widget child = const Text('')}) {
    return Container(
      alignment: Alignment.center,
      width: 96,
      height: 38,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: color == AppColors.secondary
            ? Border.all(color: Colors.black, width: 1)
            : null,
      ),
      child: child,
    );
  }

  static Widget buildMoreDialogForNotes(
    double height,
    BuildContext context,
    TextEditingController titleController,
    TextEditingController bodyController,
  ) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height * 0.4,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 36),
              child: Row(
                children: [
                  Icon(Icons.delete_outline, size: 36),
                  SizedBox(width: 33),
                  InkWell(
                    onTap: () {
                      titleController.clear();
                      bodyController.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Delete note", style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),
            ),
            Container(width: double.infinity, height: 1, color: Colors.black),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 15, bottom: 0),
              child: Column(
                children: [
                  Text(
                    "Select Colour",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: height * 0.2,
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 17,
                        crossAxisSpacing: 30,
                        childAspectRatio: 1,
                      ),
                      children: [
                        for (var color in colors!)
                          GestureDetector(
                            onTap: () async {
                              final list = await NotesLocalStorage.loadNotes();

                              NoteDM last;
                              if (list.isEmpty) {
                                last = NoteDM(
                                  id: -1,
                                  title: '',
                                  body: '',
                                  createdAt: 0,
                                );
                              } else {
                                last = list.last;
                              }

                              final lastId = last.id;
                              final nextId = lastId == -1 ? 1 : lastId + 1;

                              Navigator.pop(
                                context,
                                NoteDM(
                                  id: nextId,
                                  title: titleController.text,
                                  body: bodyController.text,
                                  createdAt: DateTime.now().day,
                                  backColor: color,
                                ),
                              );
                              Navigator.pop(
                                context,
                                NoteDM(
                                  id: nextId,
                                  title: titleController.text,
                                  body: bodyController.text,
                                  createdAt: DateTime.now().day,
                                  backColor: color,
                                ),
                              );
                            },
                            child: _buildContainers(color),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildMoreDialogForToDos(
      double height,
      BuildContext context,
      List<TodoItem> todosList
      ) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height * 0.4,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 36),
              child: Row(
                children: [
                  Icon(Icons.delete_outline, size: 36),
                  SizedBox(width: 33),
                  InkWell(
                    onTap: () {
                      todosList.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Delete note", style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),
            ),
            Container(width: double.infinity, height: 1, color: Colors.black),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 15, bottom: 0),
              child: Column(
                children: [
                  Text(
                    "Select Colour",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: height * 0.2,
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 17,
                        crossAxisSpacing: 30,
                        childAspectRatio: 1,
                      ),
                      children: [
                        for (var color in colors!)
                          GestureDetector(
                            onTap: () async {
                              final list = await TodosLocalStorage.loadTodos();

                              TodoList last;
                              if (list.isEmpty) {
                                last = TodoList(
                                  id: -1,
                                  todos: [],
                                  backColor: Colors.transparent,
                                  createdAt: 0,
                                );
                              } else {
                                last = list.last;
                              }

                              final lastId = last.id;
                              final nextId = lastId == -1 ? 1 : lastId + 1;

                              Navigator.pop(
                                context,
                                TodoList(
                                  id: nextId,
                                  todos: todosList,
                                  createdAt: DateTime.now().day,
                                  backColor: color,
                                ),
                              );
                              Navigator.pop(
                                context,
                                TodoList(
                                  id: nextId,
                                  todos: todosList,
                                  createdAt: DateTime.now().day,
                                  backColor: color,
                                ),
                              );
                            },
                            child: _buildContainers(color),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildContainers(Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: color == AppColors.secondary
            ? Border.all(color: Colors.black, width: 1)
            : null,
      ),
    );
  }

  static Widget buildAddButton(VoidCallback callback) {
    return RawMaterialButton(
      onPressed: callback,
      splashColor: Colors.transparent,
      fillColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      elevation: 10,
      constraints: BoxConstraints.tight(Size(70, 70)),
      child: Icon(Icons.add, color: AppColors.secondary, size: 48),
    );
  }
}
