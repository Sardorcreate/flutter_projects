import 'dart:convert';

import 'package:habit/screens/main_screen_elements/notes/screens/notes_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodosLocalStorage {
  static const String key = 'todos_list';

  /// Save entire list
  static Future<void> saveTodos(List<TodoList> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
    notes.map((note) => jsonEncode(note.toMap())).toList();
    await prefs.setStringList(key, jsonList);
  }

  /// Load all notes
  static Future<List<TodoList>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(key);
    if (jsonList == null) return [];
    return jsonList
        .map((jsonStr) => TodoList.fromMap(jsonDecode(jsonStr)))
        .toList();
  }

  /// Add one note
  static Future<void> addOneTodo(TodoList note) async {
    // final prefs = await SharedPreferences.getInstance();
    final notes = await loadTodos();
    notes.add(note);
    await saveTodos(notes);
  }

  /// Delete one note by its createdAt (id)
  static Future<bool> deleteTodoById(int id) async {
    try {
      // final prefs = await SharedPreferences.getInstance();
      final notes = await loadTodos();
      final initialLength = notes.length;

      notes.removeWhere((note) => note.id == id);

      // Check if a note was actually removed
      if (notes.length == initialLength) {
        return false;
      }

      await saveTodos(notes);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Clear all
  static Future<void> clearTodos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
