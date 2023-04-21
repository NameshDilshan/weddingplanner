import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/my_drawer.dart';

class WeddingCardsPage extends StatefulWidget {
  const WeddingCardsPage({Key? key}) : super(key: key);

  @override
  State<WeddingCardsPage> createState() => _WeddingCardsPageState();
}

class _WeddingCardsPageState extends State<WeddingCardsPage> {
  var loopVar = [];
  var itemList = [];
  TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var collectionName = 'weddingCards';

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          itemList.add(element.data()['name']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wedding Cards Menu", textAlign: TextAlign.center),
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
                  addItem();
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
                    labelText: 'Wedding Card Name',
                  ),
                  validator: (value) {
                    return value == null || value.trim().isEmpty
                        ? 'Please enter a Text to save'
                        : null;
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
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(itemList[index]),
                      trailing: IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection(collectionName)
                                .where('name', isEqualTo: itemList[index])
                                .get()
                                .asStream()
                                .forEach((element) {
                              for (var x in element.docs) {
                                x.reference.delete();
                              }
                            }).then((value) => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) =>
                                            const WeddingCardsPage())));
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  addItem() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        FirebaseFirestore.instance.collection(collectionName).doc().set({
          'name': textController.text
        }).then((value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const WeddingCardsPage())));
      }
    }
  }
}
