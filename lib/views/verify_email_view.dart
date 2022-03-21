import 'package:flutter/material.dart';
import 'package:fundoo_app/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Varify Email'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
              },
              child: const Text('Send Email varification'),
            ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().logout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  'registerRoute',
                  (route) => false,
                );
              },
              child: const Text('Restart'),
            )
          ],
        ),
      ),
    );
  }
}
