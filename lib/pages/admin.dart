import 'package:flutter/material.dart';

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
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Text('Admin Menu',
                style: TextStyle(
                  fontSize: 30,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('Caterers'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const CatererPage()));
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

class _AdminState extends State<Admin> {

  @override
  Widget build(BuildContext context) {
    return adminDrawer(context);
  }
}
