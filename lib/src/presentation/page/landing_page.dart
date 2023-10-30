import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/images_path.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  Future<bool> goToHomePage() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: goToHomePage(),
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              Future.delayed(const Duration(milliseconds: 500))
                  .then((_) => context.go('/home'));
            }
            return Center(
              child: Image.asset(
                ImagesPath.loading,
                scale: 2,
              ),
            );
          }),
    );
  }
}
