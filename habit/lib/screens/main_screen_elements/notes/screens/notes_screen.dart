import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/core/storage/todos_storage.dart';
import 'package:habit/screens/main_screen_elements/notes/screens/add_notes.dart';
import 'package:habit/screens/main_screen_elements/notes/screens/add_to_dos.dart';
import 'package:habit/screens/main_screen_elements/notes/widgets/notes_widgets.dart';
import 'package:habit/screens/main_screen_elements/notes/widgets/notes_widgets_grid_view.dart';
import 'package:habit/widgets/onboarding_widgets.dart';

import '../../../../core/storage/notes_storage.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List<dynamic> list = [];

  bool isGridView = false;

  int count = 1;

  List<IconData> icons = [
    Icons.grid_view,
    Icons.view_stream
  ];

  @override
  void initState() {
    loadNotes();
    super.initState();
  }

  void loadNotes() async {
    final notes = await NotesLocalStorage.loadNotes();
    final todos =  await TodosLocalStorage.loadTodos();
    setState(() {
      list = [...notes, ...todos];
    });
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (!didPop) {
          bool shouldExit = await OnboardingWidgets.buildExitDialog(context, height, width);
          if (shouldExit) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          toolbarHeight: height * 0.07,
          title: Text("Notes", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              splashColor: Colors.transparent,
              onPressed: () async {
                final result = await showDialog(context: context, builder: (BuildContext context) {
                  return NotesWidgets.buildDialog(height, context);
                });
                if (result != null) {
                  setState(() {
                    list = result;
                  });
                }
              },
              icon: Icon(Icons.color_lens),
            ),
            IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  isGridView = !isGridView;
                  count = isGridView ? 2 : 1;
                });
              },
              icon: Icon(isGridView ? icons[1] : icons[0]),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: NotesWidgets.buildAddButton(
          () async {
            final  result = await showDialog(context: context, builder: (BuildContext context) {
              return NotesWidgets.buildAddDialog(
                context, height,
                () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddNotes())
                    );

                    if (result != null && result is NoteDM) {
                      Navigator.pop(context, result);
                    }
                  },
                () async {
                  final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddToDos()),
                  );

                  if (result != null && result is TodoList) {
                    Navigator.pop(context, result);
                  }
                },
                'Add note', 'Add to-do', Icons.keyboard, Icons.check_box
              );
            });
            if (result != null) {
              setState(() {
                list.insert(0, result);
              });

              if (result is NoteDM) {
                await NotesLocalStorage.addOneNote(result);
              } else if (result is TodoList) {
                await TodosLocalStorage.addOneTodo(result);
              }
            }
          }
        ),
        body: Builder(builder: (context){
            if (list.isNotEmpty == true) {
              return NotesWidgetsGridView(count: count, list: list, deletedNoteId: (int noteId) {
                setState(() {
                  list.removeWhere((element) => element.id == noteId);
                });
              });
            }
            return NotesWidgets.emptyScreen();
          }
        ),
      ),
    );
  }
}


class NoteDM {
  final int id;
  final String title;
  final String body;
  final int createdAt;
  final Color? backColor;

  NoteDM({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    this.backColor = Colors.transparent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'createdAt': createdAt,
      'backColor': backColor?.value, // store as int
    };
  }

  factory NoteDM.fromMap(Map<String, dynamic> map) {
    return NoteDM(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      createdAt: map['createdAt'] ?? 0,
      backColor: map['backColor'] != null
          ? Color(map['backColor'])
          : Colors.transparent,
    );
  }
}

class TodoList {
  final int id;
  final int createdAt;
  final List<TodoItem> todos;
  final Color backColor;

  TodoList({
    required this.id,
    required this.createdAt,
    required this.todos,
    required this.backColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'todos': todos.map((todo) => todo.toMap()).toList(),
      'color': backColor.value,
    };
  }

  factory TodoList.fromMap(Map<String, dynamic> map) {
    return TodoList(
      id: map['id'] ?? '',
      createdAt: map['createdAt'] ?? 0,
      todos: map['todos'] != null
          ? (map['todos'] as List).map((todoMap) => TodoItem.fromMap(todoMap)).toList()
          : [],
      backColor: map['backColor'] != null
          ? Color(map['backColor'])
          : Colors.transparent,
    );
  }
}

class TodoItem {
  final String text;
  bool isCompleted;

  TodoItem({
    required this.text,
    required this.isCompleted,
  });

  // Method to convert to map for storage
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isCompleted': isCompleted,
    };
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      text: map['text'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }
}