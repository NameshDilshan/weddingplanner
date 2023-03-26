import 'package:firebase_auth/firebase_auth.dart';
import 'package:weddingplanner/auth.dart';
import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/client_homepage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget _userUID(){
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton(){
    return ElevatedButton(onPressed: signOut, child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return ClientHomePage();
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
