import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/my_drawer.dart';

class CatererPage extends StatefulWidget {
  const CatererPage({Key? key}) : super(key: key);

  @override
  State<CatererPage> createState() => _CatererPageState();
}

class _CatererPageState extends State<CatererPage> {
  var loopVar = [];
  var caterersList = [];
  TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _loginformformKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('caterers')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          caterersList.add(element.data()['name']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caterer Menu", textAlign: TextAlign.center),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: const ButtonStyle(
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  addCaterer();
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: textController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Caterer Name',
                  ),
                  validator: (value) {
                    return value == null || value.trim().isEmpty ? 'Please enter a Text to save' : null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: caterersList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            key: _formKey,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: caterersList[index],
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  addCaterer() {
    print(_formKey.currentState?.validate());
    print(textController.text);
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        String? email = textController.text;
      }
    }
  }
}
