import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieLikeProvider extends ChangeNotifier {
  final List<int> _likedId = [];

  List<int> get likedId => _likedId;

  void addLikedId (int id) {
    if (!_likedId.any((i) => i == id)) {
      _likedId.add(id);
    }
    notifyListeners();
  }

  void removeLikeId (int id){
    _likedId.removeWhere((i) => i == id);
  }
}