import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_explorer/pages/homepage.dart';
import 'package:movie_explorer/pages/sign_up.dart';
import 'package:movie_explorer/provider/homepagepositionprovider.dart';
import 'package:movie_explorer/provider/movielikeprovider.dart';
import 'package:movie_explorer/router.dart';
import 'package:provider/provider.dart';

class AuthenticationFlowScreen extends StatelessWidget {
  const AuthenticationFlowScreen({super.key});

  static String id = 'main screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const SignupScreen();
          }
        },
      ),
    );
  }
}
