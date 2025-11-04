import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _name;

  String? get name => _name;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
