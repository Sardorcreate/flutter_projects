import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/main_screen_elements/notes/screens/notes_screen.dart';
import 'package:habit/screens/main_screen_elements/notes/widgets/notes_widgets.dart';
import 'package:habit/screens/main_screen_elements/notes/widgets/todo_item_widget.dart';
import 'package:habit/widgets/app_bar.dart';

class AddToDos extends StatefulWidget {

  const AddToDos({super.key, this.existedTodo});

  final TodoList? existedTodo;

  @override
  State<AddToDos> createState() => _AddToDosState();
}

class _AddToDosState extends State<AddToDos> {

  final TextEditingController _newTodoController = TextEditingController();

  List<TodoItem> todos = [];

  @override
  void initState() {
    super.initState();
    if (widget.existedTodo != null) {
      todos = widget.existedTodo!.todos;
    }
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBarWidget(
        title: "Add To-do",
        background: AppColors.secondary,
        hasIcon: true,
        callback: (){
          showDialog(context: context, builder: (BuildContext context){
            return NotesWidgets.buildMoreDialogForToDos(height, context, todos);
          });
        },
      ),
      body: Column(
        children: [
          _buildAddTodoSection(),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoItemWidget(
                  todo: todos[index],
                  onToggle: (value) {
                    setState(() {
                      todos[index].isCompleted = value;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddTodoSection() {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: Colors.black45,
            size: 24.0,
          ),
          SizedBox(width: 12.0),
          // Text field
          Expanded(
            child: TextField(
              controller: _newTodoController,
              decoration: InputDecoration(
                hintText: 'Type something...',
                hintStyle: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 23,
                  fontWeight: FontWeight.w400
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: (value) => _addTodo(),
            ),
          ),
        ],
      ),
    );
  }

  void _addTodo() {
    if (_newTodoController.text.trim().isNotEmpty) {
      setState(() {
        todos.add(TodoItem(
          text: _newTodoController.text.trim(),
          isCompleted: false,
        ));
        _newTodoController.clear();
      });
    }
  }

  @override
  void dispose() {
    _newTodoController.dispose();
    super.dispose();
  }
}