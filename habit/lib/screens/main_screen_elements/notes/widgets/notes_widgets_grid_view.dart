import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/core/storage/notes_storage.dart';
import 'package:habit/screens/main_screen_elements/notes/screens/add_notes.dart';
import 'package:habit/screens/main_screen_elements/notes/screens/add_to_dos.dart';
import 'package:habit/screens/main_screen_elements/notes/screens/notes_screen.dart';
import 'package:habit/screens/main_screen_elements/profile/widgets/profile_widgets.dart';

class NotesWidgetsGridView extends StatefulWidget {
  const NotesWidgetsGridView({
    super.key,
    required this.list,
    required this.deletedNoteId,
    required this.count,
  });

  final List<dynamic>? list;
  final Function(int) deletedNoteId;
  final int count;

  @override
  State<NotesWidgetsGridView> createState() => _NotesWidgetsGridViewState();
}

class _NotesWidgetsGridViewState extends State<NotesWidgetsGridView> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final visibleList = widget.list
        ?.where((item) =>
            item is NoteDM || (item.todos != null && item.todos.isNotEmpty))
          .toList() ??
        [];

    return MasonryGridView.count(
      crossAxisCount: widget.count,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      itemCount: visibleList.length, //widget.list?
      itemBuilder: (context, index) {
        final item = visibleList[index]; //widget.list?

        return GestureDetector(
          onTap: () {
            item is NoteDM
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNotes(existingNote: item),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToDos(existedTodo: item),
                    ),
                );
          },
          onLongPress: () {
            showDialog(context: context, builder: (BuildContext context) {
              return ProfileWidgets.buildLogOutDialog(
                  context, height, width,
                  'Delete note',
                  'Are you sure you want to delete this note?',
                  'Delete',
                      () async {
                    final result = await NotesLocalStorage.deleteNoteById(item.id);
                    if (result) {
                      widget.deletedNoteId(item.id);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to delete the note"))
                      );
                    }
                    Navigator.pop(context);
                  }
              );
            });
          },
          child: Container(
            width: widget.count == 1 ? width : (width / 2) - 24,
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            padding: item is NoteDM
                ? EdgeInsets.symmetric(horizontal: 26, vertical: 16)
                : EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            decoration: BoxDecoration(
              color: item.backColor,
              borderRadius: BorderRadius.circular(12),
              border: item.backColor == AppColors.secondary
                  ? Border.all(color: Colors.black, width: 1)
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item is NoteDM)
                  Text(item.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                else if (item.todos != null)
                  Column(
                    children: [
                      for (var todo in item.todos)
                        Row(
                          children: [
                            Checkbox(
                              value: todo.isCompleted,
                              onChanged: (value) => {
                                setState(() {
                                  todo.isCompleted = value!;
                                })
                              },
                            ),
                            Expanded(
                              child: Text(todo.text,
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.visible,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${item.createdAt}",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}