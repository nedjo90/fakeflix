import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieDetailsNavBar extends StatelessWidget{
  const MovieDetailsNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    context.go('/');
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                    size: 42,
                  ),
                ),
              ),
            ],
          ),
        );
  }

}