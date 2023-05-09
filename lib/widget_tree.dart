import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/client/client_dashboard.dart';
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
  }
}
