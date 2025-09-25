import 'package:flutter/cupertino.dart';

class Functions extends ChangeNotifier{
  int _count = 0;
  bool _switchValue = false;
  bool _locked = false;
  bool _isSwapped = false;

  int get count => _count;
  bool get switchValue => _switchValue;
  bool get locked => _locked;
  bool get isSwapped => _isSwapped;

  void swap() {
    _isSwapped = !_isSwapped;
    notifyListeners();
  }

  void setSwitchValue(bool value){
    _switchValue = value;
    if (!value) {
      _locked = false;
    }
    notifyListeners();
  }

  void increment() {
    if (_locked == true) return;

    if (_switchValue == true && _count < 0) {
      _count += 1;
      if (_count >= 0) {
        _count = 0;
        _locked = true;
      }
    } else {
      _count++;
    }
    notifyListeners();
  }

  void decrement() {
    if (_locked == true) return;

    if (_switchValue == true && count > 0) {
      _count -= 1;
      if (_count <= 0) {
        _count = 0;
        _locked = true;
      }
    } else {
      _count--;
    }
    notifyListeners();
  }

  void reset(){
    _count = 0;
    notifyListeners();
  }

}