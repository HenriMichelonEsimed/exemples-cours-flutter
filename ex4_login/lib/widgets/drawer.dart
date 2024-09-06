import 'package:ex4_login/consts.dart';
import 'package:ex4_login/login_state.dart';
import 'package:ex4_login/main.dart';
import 'package:ex4_login/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              child: Text(appTitle)
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Products"),
            onTap: () =>
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage())),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log out"),
            onTap: () {
              Provider.of<LoginState>(context, listen: false).disconnect();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
      ]));
  }
}