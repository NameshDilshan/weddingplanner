import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../login_register_page.dart';

class ClientDashboard extends StatefulWidget {
  final String email;

  const ClientDashboard({Key? key, required this.email}) : super(key: key);

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  // late DocumentSnapshot<Object?> userData ;
  DateTime selectedDate = DateTime.now();
  String guestCount = "";
  String catererName = "";
  String honeymoonName = "";
  String liquorName = "";
  String photographyName = "";
  String stylistName = "";
  String venueName = "";
  String weddingCardName = "";
  String weddingCarName = "";
  String weddingDressName = "";
  String catererDescription = "";
  String honeymoonDescription = "";
  String liquorDescription = "";
  String photographyDescription = "";
  String stylistDescription = "";
  String venueDescription = "";
  String weddingCardDescription = "";
  String weddingCarDescription = "";
  String weddingDressDescription = "";

  var collectionNamesList = [
    "caterers",
    "honeyMoons",
    "liquors",
    "photography",
    "stylists",
    // "venues",
    "weddingCards",
    "weddingCars",
    "weddingDresses"
  ];
  var userKeyList = [
    "caterer",
    "honeymoon",
    "liquor",
    "photography",
    "stylist",
    "venue",
    "weddingcard",
    "weddingcar",
    "weddingDress"
  ];
  var nameVariableList = [
    "catererName",
    "honeymoonName",
    "liquorName",
    "photographyName",
    "stylistName",
    "venueName",
    "weddingCardName",
    "weddingCarName",
    "weddingDressName"
  ];
  var descriptionVariableList = [
    "catererDescription",
    "honeymoonDescription",
    "liquorDescription",
    "photographyDescription",
    "stylistDescription",
    "venueDescription",
    "weddingCardDescription",
    "weddingCarDescription",
    "weddingDressDescription"
  ];
  Map<String, String> map = {};

  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage())),
        child: const Text('Sign Out'));
  }

  void getDataFromFirestore() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.email)
        .get()
        .then<dynamic>((DocumentSnapshot snapshot) async {
          selectedDate = snapshot.get('weddingdate').toDate();
          guestCount = snapshot.get('guestCount');
      for (var i = 0; i < collectionNamesList.length; ++i) {
        // print(snapshot.get(userKeyList[i]).toString());
        FirebaseFirestore.instance
            .collection(collectionNamesList[i])
            .where('name', isEqualTo: snapshot.get(userKeyList[i]))
            .get()
            .asStream()
            .forEach(
          (element) {
            for (var x in element.docs) {
              print("hi44");
              // print("descriptionVariableList[i] : ${descriptionVariableList[i]} : " +x.get('description'));
              setState(() {
                map.putIfAbsent(
                    descriptionVariableList[i], () => x.get('description'));
                // descriptionVariableList[i] = x.get('description');
              });
            }
          },
        );
      }
    });

    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(widget.email)
    //     .snapshots()
    //     .listen((snapshot) {
    //   setState(() {
    //     userData = snapshot;
    //     print("hi2");
    //     print(collectionNamesList.length);
    //     for (var i = 0; i < collectionNamesList.length; ++i) {
    //       print("hi3");
    //       nameVariableList[i] = userData.get(userKeyList[i]);
    //       print("namevariablelsist");
    //       print(nameVariableList[i]);
    //       FirebaseFirestore.instance
    //           .collection(collectionNamesList[i])
    //           .where('name', isEqualTo: userData.get(userKeyList[i]))
    //           .get()
    //           .asStream()
    //           .forEach(
    //         (element) {
    //           for (var x in element.docs) {
    //             print("hi4");
    //             print(x);
    //             descriptionVariableList[i] = x.get('description');
    //           }
    //         },
    //       );
    //     }

    // if ((userData.data() as Map<String, dynamic>).containsKey('caterer')) {
    //   catererName = userData.get('caterer');
    //   FirebaseFirestore.instance
    //       .collection('caterers')
    //       .where('name', isEqualTo: userData.get('caterer'))
    //       .get()
    //       .asStream()
    //       .forEach((element) {
    //     for (var x in element.docs) {
    //       catererDescription = x.get('description');
    //     }
    //   });
    // }

    //   });
    // });
    // return 'result';
  }

  @override
  void initState() {
    super.initState();
    getDataFromFirestore();
    // print("hi1");
  }

  @override
  Widget build(BuildContext context) {
    // for(var x in map.entries){
    //   SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         const SizedBox(
    //           height: 20.0,
    //         ),
    //         Material(
    //           elevation: 15.0,
    //           shadowColor: Colors.black26,
    //           child: ListTile(
    //             leading: const Icon(Icons.access_alarm_outlined),
    //             title: Text(x.key.isEmpty  ? 'No Caterer Selected' : " Caterer Name:  $x"),
    //             subtitle: Text(x.value.isEmpty ? x.value : ''),
    //             tileColor: Colors.white,
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    // print("selectedDate");
    // print(selectedDate);
    return Scaffold(
      appBar: AppBar(title: const Text('Client Menu'), actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(child: _signOutButton()),
                ]),
      ]),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
           Material(
            elevation: 15.0,
            shadowColor: Colors.black26,
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text("Wedding Date"),
              subtitle: Text(selectedDate.toString()),
              tileColor: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            elevation: 15.0,
            shadowColor: Colors.black26,
            child: ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Total Guest Count"),
              subtitle: Text(guestCount),
              tileColor: Colors.white,
            ),
          ),
          Flex(direction: Axis.horizontal, children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: map.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = map.keys.elementAt(index);
                  var icon = Icons.format_list_bulleted;
                  if (key == "photographyDescription") {
                    key = "Photographer";
                    icon = Icons.camera_alt_outlined;
                  }
                  if (key == "liquorDescription") {
                    key = "Liquor";
                    icon = Icons.wine_bar;
                  }
                  if (key == "catererDescription") {
                    key = "Caterer";
                    icon = Icons.fastfood;
                  }
                  if (key == "weddingCarDescription") {
                    key = "Wedding Car";
                    icon = Icons.directions_car;
                  }
                  if (key == "weddingCardDescription") {
                    key = "Wedding Card";
                    icon = Icons.card_giftcard;
                  }
                  if (key == "honeymoonDescription") {
                    key = "Honeymoon";
                    icon = Icons.dark_mode;
                  }
                  if (key == "weddingDressDescription") {
                    key = "Wedding Dress";
                    icon = Icons.girl;
                  }
                  if (key == "stylistDescription") {
                    key = "Stylist";
                    icon = Icons.style;
                  }
                  return Column(
                    children: <Widget>[
                      ////////////////////////////////////////////////
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        elevation: 15.0,
                        shadowColor: Colors.black26,
                        child: ListTile(
                          leading: Icon(icon),
                          title: Text(key.isEmpty
                              ? 'No $key Selected'
                              : " $key Name:  ${map.values.elementAt(index)}"),
                          subtitle: Text(map.values.elementAt(index)),
                          tileColor: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ]),
        ],
      ),
    );
    // }
  }
}

// const SizedBox(
//   height: 20,
// ),
// Material(
//   elevation: 15.0,
//   shadowColor: Colors.black26,
//   child: ListTile(
//     leading: const Icon(Icons.access_alarm_outlined),
//     title: Text(catererName.isEmpty
//         ? 'No Caterer Selected'
//         : " Caterer Name:  $catererName"),
//     subtitle: Text(catererDescription),
//     tileColor: Colors.white,
//   ),
// ),
// const SizedBox(
//   height: 20,
// ),
