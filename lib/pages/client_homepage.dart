import 'package:flutter/material.dart';
import 'login_register_page.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
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
