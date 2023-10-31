import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:templates/src/presentation/provider/auth_provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<LoginInfo>().login("tester");
            context.go('/');
          },
          child: const Text("Signin"),
        ),
      ),
    );
  }
}
