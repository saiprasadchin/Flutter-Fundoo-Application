import 'package:flutter/material.dart';
import 'package:fundoo_app/enums/menu_action.dart';
import 'package:fundoo_app/services/auth/auth_service.dart';

class NoteView extends StatefulWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  await AuthService.firebase().logout();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    'loginRoute',
                    (route) => false,
                  );
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: MenuAction.logout,
                  child: Text("Log out"),
                )
              ];
            },
          ),
        ],
      ),
      body: const Text("Hello world"),
    );
  }
}
