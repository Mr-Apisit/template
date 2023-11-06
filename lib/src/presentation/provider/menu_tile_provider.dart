import 'package:flutter/material.dart';

class MenuTile extends ChangeNotifier {
  Color _item = const Color(0xFFFFFFFF);
  Color get getItem => _item;

  void selected(Color item) {
    _item = item;
    notifyListeners();
  }
}
