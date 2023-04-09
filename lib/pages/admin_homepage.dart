import 'package:flutter/material.dart';

import 'login_register_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage())),
        child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Wedding Planner"),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        const PopupMenuItem(child: Text("username")),
                        PopupMenuItem(child: _signOutButton()),
                      ])
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
