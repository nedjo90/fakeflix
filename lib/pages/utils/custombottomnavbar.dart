import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_explorer/authenticationbloc/authentication_bloc.dart';
import 'package:movie_explorer/pages/utils/moviepreview.dart';
import 'package:movie_explorer/provider/homepagepositionprovider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget{
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Provider.of<HomePagePositionProvider>(context, listen: false).changePosition(0.0);
                context.go('/');
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              )),
          IconButton(
              onPressed: () {
                context.go('/movieliked');
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              )),
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(SignOut());
                context.go('/Auth');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 40,
              ))
        ],
      ),
    );
  }

}