import 'package:flutter/material.dart';
import 'package:fundoo_app/services/auth/auth_service.dart';
import 'package:fundoo_app/views/login_view.dart';
import 'package:fundoo_app/views/register_view.dart';
import 'package:fundoo_app/views/verify_email_view.dart';
import 'views/notes_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        'loginRoute': (context) => const LoginView(),
        'registerRoute': (context) => const RegisterView(),
        'notesRoute': (context) => const NoteView(),
        'verifyEmailRoute': (context) => const VerifyEmailView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NoteView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
