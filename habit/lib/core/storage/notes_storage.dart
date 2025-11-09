import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/main_screen_elements/notes/screens/notes_screen.dart';

class NotesLocalStorage {
  static const String key = 'notes_list';

  /// Save entire list
  static Future<void> saveNotes(List<NoteDM> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
    notes.map((note) => jsonEncode(note.toMap())).toList();
    await prefs.setStringList(key, jsonList);
  }

  /// Load all notes
  static Future<List<NoteDM>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(key);
    if (jsonList == null) return [];
    return jsonList
        .map((jsonStr) => NoteDM.fromMap(jsonDecode(jsonStr)))
        .toList();
  }

  /// Add one note
  static Future<void> addOneNote(NoteDM note) async {
    // final prefs = await SharedPreferences.getInstance();
    final notes = await loadNotes();
    notes.add(note);
    await saveNotes(notes);
  }

  static Future<void> saveIsLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<bool> getIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  /// Delete one note by its createdAt (id)
  static Future<bool> deleteNoteById(int id) async {
    try {
      // final prefs = await SharedPreferences.getInstance();
      final notes = await loadNotes();
      final initialLength = notes.length;

      notes.removeWhere((note) => note.id == id);

      // Check if a note was actually removed
      if (notes.length == initialLength) {
        return false;
      }

      await saveNotes(notes);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Clear all
  static Future<void> clearNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
