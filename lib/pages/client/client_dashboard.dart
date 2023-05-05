import 'package:flutter/material.dart';

import '../login_register_page.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({Key? key}) : super(key: key);

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {

  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage())),
        child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Client Menu'), actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: _signOutButton()),
            ]),
      ]),
      body : ListView.builder(
        itemCount: 500,
        itemBuilder: (context, i) {
          return Column(
            children: const [
               Material(
                 elevation: 15.0,
                 shadowColor: Colors.black26,
                 child: ListTile(
                  leading: Icon(Icons.access_alarm_outlined),
                  title: Text("asdf"),
                  subtitle: Text("asdf"),
                  tileColor: Colors.white,
              ),
               ),
              SizedBox(
                height: 20,
              )
            ],
          );
        },
      ),
    );
  }
}

