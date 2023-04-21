import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/my_drawer.dart';

import '../login_register_page.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage())),
        child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Menu'), actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(child: _signOutButton()),
                ]),
      ]),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
