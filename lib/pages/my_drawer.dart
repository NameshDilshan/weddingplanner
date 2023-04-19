import 'package:flutter/material.dart';

import 'adminpages/caterer_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Drawer(
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

                  // Navigator.of(context).pop();
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
      );
  }
}
