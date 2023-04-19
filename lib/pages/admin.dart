import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/my_drawer.dart';

import 'adminpages/caterer_page.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

Widget adminDrawer(context){
  return Scaffold(
    appBar: AppBar(title: const Text('Admin Menu')),
    body: const Center(
      child: Text('My Page!'),
    ),
    drawer: const MyDrawer(),
  );
}

class _AdminState extends State<Admin> {

  @override
  Widget build(BuildContext context) {
    return adminDrawer(context);
  }
}
