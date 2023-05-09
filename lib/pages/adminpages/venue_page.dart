import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/my_drawer.dart';

class VenuePage extends StatefulWidget {
  const VenuePage({Key? key}) : super(key: key);

  @override
  State<VenuePage> createState() => _VenuePageState();
}

class _VenuePageState extends State<VenuePage> {
  var loopVar = [];
  var nameItemList = [];
  var descItemList = [];
  TextEditingController textController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var collectionName = 'venues';

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          nameItemList.add(element.data()['name']);
          descItemList.add(element.data()['description']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venue Menu", textAlign: TextAlign.center),
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
          // Center(
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width * 0.5,
          //     height: MediaQuery.of(context).size.height * 0.05,
          //     child: Form(
          //       key: _formKey,
          //       child: TextFormField(
          //         controller: textController,
          //         textAlign: TextAlign.center,
          //         decoration: const InputDecoration(
          //           border: UnderlineInputBorder(),
          //           labelText: 'Venue Hotel Name',
          //         ),
          //         validator: (value) {
          //           return value == null || value.trim().isEmpty
          //               ? 'Please enter a Text to save'
          //               : null;
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 80 / 100,
                child: TextFormField(
                  controller: textController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Venue Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Venue Name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 80 / 100,
                child: TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Venue Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Description';
                    }
                    return null;
                  },
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 40.0,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: nameItemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(nameItemList[index]),
                      subtitle: Text(descItemList[index]),
                      trailing: IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection(collectionName)
                                .where('name', isEqualTo: nameItemList[index])
                                .get()
                                .asStream()
                                .forEach((element) {
                              for (var x in element.docs) {
                                x.reference.delete();
                              }
                            }).then((value) => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) =>
                                            const VenuePage())));
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
          'name': textController.text,
          'description': descriptionController.text
        }).then((value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const VenuePage())));
      }
    }
  }
}
