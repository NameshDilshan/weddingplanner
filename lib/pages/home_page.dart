import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/client_homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClientHomePage();
      // Scaffold(
      // body:
      // Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   padding: const EdgeInsets.all(20),
      //   child:
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     // _userUID(),
        //     // _signOutButton(),
        //   ],
        // ),
      // ),
    // );
  }
}
