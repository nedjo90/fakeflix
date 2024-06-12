import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePagePositionProvider extends ChangeNotifier {
  double _position = 0.0;

  double get position => _position;

  void changePosition (double newPosition) {
    _position = newPosition;
    notifyListeners();
  }
}