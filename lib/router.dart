import 'package:go_router/go_router.dart';
import 'package:movie_explorer/pages/authenticationflowscreen.dart';
import 'package:movie_explorer/pages/homepage.dart';
import 'package:movie_explorer/pages/loginpage.dart';
import 'package:movie_explorer/pages/moviedetailspage.dart';
import 'package:movie_explorer/pages/movielikepage.dart';
import 'package:movie_explorer/pages/sign_up.dart';


final fakeFlixRouter = GoRouter(initialLocation: '/',
routes: [
  GoRoute(name: 'Home',path: '/', builder: (context, state) => const HomePage()),
  GoRoute(name: 'Auth',path: '/auth', builder: (context, state) => const AuthenticationFlowScreen()),
  GoRoute(name: 'SignUp',path: '/signup', builder: (context, state) => const SignupScreen()),
  GoRoute(name: 'Login',path: '/login', builder: (context, state) => const LoginPage()),
  GoRoute(
    name: 'MovieDetails',
    path: '/moviedetails/:id',
    builder: (context, state) {
      return MovieDetailsPage(id: int.parse(state.pathParameters['id']!));
    },
  ),
  GoRoute(name: 'Like',path: '/movieliked', builder: (context, state) => const MovieLikePage()),
]);

