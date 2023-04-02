import 'package:flutter/material.dart';
import 'package:weddingplanner/auth.dart';
import 'package:weddingplanner/pages/client_homepage.dart';
import 'package:weddingplanner/pages/home_page.dart';
import 'package:weddingplanner/pages/login_register_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return const LoginPage();
      // StreamBuilder(
      // stream: Auth().authStateChanges,
      // builder: (context, snapshot) {
      //   if (snapshot.hasData) {
      //     return const ClientHomePage();
      //   } else {
      //     return const LoginPage();
      //   }
      // },
    // );
  }
}
