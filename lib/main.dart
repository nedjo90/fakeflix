import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_explorer/provider/homepagepositionprovider.dart';
import 'package:movie_explorer/provider/movielikeprovider.dart';
import 'package:movie_explorer/router.dart';
import 'package:movie_explorer/services/movie_service.dart';
import 'package:movie_explorer/services/popularmovieprovider.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(
      fileName:
      '.env'); // !!!! variable pour la clé api => TMDB_API_KEY (voir api_config.dart)
  await MovieService.getAllGenres();
  return runApp(const FakeFlix());
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
        theme: ThemeData(fontFamily: 'BabasNeue'),
        routerConfig: fakeFlixRouter,
      ),
    );
  }
}
