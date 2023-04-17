import 'package:flutter/material.dart';

import '../admin.dart';

class CatererPage extends StatefulWidget {
  const CatererPage({Key? key}) : super(key: key);

  @override
  State<CatererPage> createState() => _CatererPageState();
}

class _CatererPageState extends State<CatererPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caterer Menu", textAlign: TextAlign.center),
      ),
      body: ElevatedButton(
          style: const ButtonStyle(
            alignment: Alignment.center,
          ),
          onPressed: () { addCaterer(); },
          child: const Icon(Icons.add),
      ),
    );
  }

  addCaterer() {
    print('add');
  }
}
