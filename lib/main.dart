import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_explorer/authenticationbloc/authentication_bloc.dart';
import 'package:movie_explorer/pages/authenticationflowscreen.dart';
import 'package:movie_explorer/provider/homepagepositionprovider.dart';
import 'package:movie_explorer/provider/movielikeprovider.dart';
import 'package:movie_explorer/router.dart';
import 'package:movie_explorer/services/movie_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(
      fileName:
          '.env'); // !!!! variable pour la clé api => TMDB_API_KEY (voir api_config.dart)
  await MovieService.getAllGenres();
  runApp(BlocProvider(
      create: (context) => AuthenticationBloc(), child: const FakeFlix()));
}

class FakeFlix extends StatelessWidget {
  const FakeFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomePagePositionProvider()),
          ChangeNotifierProvider(create: (_) => MovieLikeProvider()),
        ],
        child: MaterialApp.router(
          title: 'FakeFlix',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: fakeFlixRouter,
        ));
  }
}
