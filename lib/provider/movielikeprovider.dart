import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_explorer/models/MovieDetailsModel.dart';
import 'package:movie_explorer/services/movie_service.dart';

class MovieLikeProvider extends ChangeNotifier {
  final List<MovieDetailsModel> _list = [];
  final User? user = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;


  List<MovieDetailsModel> get list => _list;

  Future<void> addLikedId(int id) async {
    DocumentReference userDoc = _firestore.collection('user').doc(user?.uid);
    await userDoc.update({'movieid': FieldValue.arrayUnion([id])});
    notifyListeners();
  }


  Future<void> removeLikeId(int id) async {
    DocumentReference userDoc = _firestore.collection('user').doc(user?.uid);
    await userDoc.update({'movieid': FieldValue.arrayRemove([id])});
    // Mettre à jour _list en enlevant le film avec l'ID `id`
    _list.removeWhere((movie) => movie.id == id);
    notifyListeners();
  }

  Future getMovies() async {
    DocumentReference userDoc = _firestore.collection('user').doc(user?.uid);
    DocumentSnapshot snapshot = await userDoc.get();
    List<dynamic> movieIds = [];
    if (snapshot.exists) {
      _list.clear();
      Map<String, dynamic>? userData = snapshot.data() as Map<String, dynamic>?;

      if (userData!.containsKey('movieid')) {
        movieIds = userData['movieid'];
        print('Liste des movieid: $movieIds');
      } else {
        print('Le champ movieid n\'existe pas dans ce document.');
      }
    } else {
      print('Le document utilisateur n\'existe pas.');
    }
    for (var id in movieIds) {
      dynamic response = await MovieService.getMovieById(id);
      MovieDetailsModel movie = MovieDetailsModel.fromJson(response.data);
      _list.add(movie);
    }
    notifyListeners();
  }
}


