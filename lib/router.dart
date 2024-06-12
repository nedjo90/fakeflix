import 'package:go_router/go_router.dart';
import 'package:movie_explorer/pages/homepage.dart';
import 'package:movie_explorer/pages/moviedetailspage.dart';
import 'package:movie_explorer/pages/movielikepage.dart';

import 'models/moviepreviewmodel.dart';

final fakeFlixRouter = GoRouter(initialLocation: '/',
routes: [
  GoRoute(name: 'Home',path: '/', builder: (context, state) => const HomePage()),
  GoRoute(
    name: 'MovieDetails',
    path: '/moviedetails/:id',
    builder: (context, state) {
      return MovieDetailsPage(id: int.parse(state.pathParameters['id']!));
    },
  ),
  GoRoute(name: 'Like',path: '/movieliked', builder: (context, state) => const MovieLikePage()),
]);

