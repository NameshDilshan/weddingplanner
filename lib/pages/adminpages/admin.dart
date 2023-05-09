import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/my_drawer.dart';

import '../login_register_page.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  var catererName = [];
  var honeymoonName = [];
  var liquorName = [];
  var photographyName = [];
  var stylistName = [];
  var venueName = [];
  var weddingCardName = [];
  var weddingCarName = [];
  var weddingDressName = [];

  var catererDescription = [];
  var honeymoonDescription = [];
  var liquorDescription = [];
  var photographyDescription = [];
  var stylistDescription = [];
  var venueDescription = [];
  var weddingCardDescription = [];
  var weddingCarDescription = [];
  var weddingDressDescription = [];

  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage())),
        child: const Text('Sign Out'));
  }
  void getDataFromFirestore() async {
    FirebaseFirestore.instance
        .collection("caterers")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            catererName.add(element.data()['name']);
            catererDescription.add(element.data()['description']);
          });
        }
      }
    });
    FirebaseFirestore.instance
        .collection("honeyMoons")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            honeymoonName.add(element.data()['name']);
            honeymoonDescription.add(element.data()['description']);
          });
        }
      }
    });
    FirebaseFirestore.instance
        .collection("liquors")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            liquorName.add(element.data()['name']);
            liquorDescription.add(element.data()['description']);
          });
        }
      }
    });
    FirebaseFirestore.instance
        .collection("photography")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            photographyName.add(element.data()['name']);
            photographyDescription.add(element.data()['description']);
          });
        }
      }
    });
    FirebaseFirestore.instance
        .collection("stylists")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            stylistName.add(element.data()['name']);
            stylistDescription.add(element.data()['description']);
          });
        }
      }
    });
    FirebaseFirestore.instance
        .collection("venues")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            venueName.add(element.data()['name']);
            venueDescription.add(element.data()['description']);
          });
        }
      }
    });
    FirebaseFirestore.instance
        .collection("weddingCards")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            weddingCardName.add(element.data()['name']);
            weddingCardDescription.add(element.data()['description']);
          });
        }
      }
    });
    FirebaseFirestore.instance
        .collection("weddingCars")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            weddingCarName.add(element.data()['name']);
            weddingCarDescription.add(element.data()['description']);
          });
        }
      }
    });
    FirebaseFirestore.instance
        .collection("weddingDresses")
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        if (mounted) {
          setState(() {
            weddingDressName.add(element.data()['name']);
            weddingDressDescription.add(element.data()['description']);
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    String cat = "";
    for (var i = 0; i < catererName.length; ++i) {
      cat += "                   \u2022 ${catererName[i]} \n";
    }
    String honeymoon = "";
    for (var i = 0; i < honeymoonName.length; ++i) {
      honeymoon += "                   \u2022 ${honeymoonName[i]} \n";
    }
    String liquor = "";
    for (var i = 0; i < liquorName.length; ++i) {
      liquor += "                   \u2022 ${liquorName[i]} \n";
    }
    String photography = "";
    for (var i = 0; i < photographyName.length; ++i) {
      photography += "                   \u2022 ${photographyName[i]} \n";
    }
    String stylist = "";
    for (var i = 0; i < stylistName.length; ++i) {
      stylist += "                   \u2022 ${stylistName[i]} \n";
    }
    String venue = "";
    for (var i = 0; i < venueName.length; ++i) {
      venue += "                   \u2022 ${venueName[i]} \n";
    }
    String weddingCard = "";
    for (var i = 0; i < weddingCardName.length; ++i) {
      weddingCard += "                   \u2022 ${weddingCardName[i]} \n";
    }
    String weddingCar = "";
    for (var i = 0; i < weddingCarName.length; ++i) {
      weddingCar += "                   \u2022 ${weddingCarName[i]} \n";
    }
    String weddingDress = "";
    for (var i = 0; i < weddingDressName.length; ++i) {
      weddingDress += "                   \u2022 ${weddingDressName[i]} \n";
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Menu'), actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(child: _signOutButton()),
                ]),
      ]),
      body: ListView(
        shrinkWrap: true,
        children:  <Widget>[
          const SizedBox(
            height: 20,
          ),
          Material(
            elevation: 15.0,
            shadowColor: Colors.black26,
            child: ListTile(
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Caterers ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(cat, style: const TextStyle(fontSize: 20.0)),
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
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Hooneymoon Suites ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(honeymoon, style: const TextStyle(fontSize: 20.0)),
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
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Liquors ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(liquor, style: const TextStyle(fontSize: 20.0)),
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
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Photographers ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(photography, style: const TextStyle(fontSize: 20.0)),
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
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Stylists ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(stylist, style: const TextStyle(fontSize: 20.0)),
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
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Venues ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(venue, style: const TextStyle(fontSize: 20.0)),
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
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Wedding Cards ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(weddingCard, style: const TextStyle(fontSize: 20.0)),
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
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Wedding Cars ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(weddingCar, style: const TextStyle(fontSize: 20.0)),
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
              leading:  const Icon(Icons.fastfood),
              title:  const Text("Wedding Dresses ", style: TextStyle(fontSize: 20.0)),
              subtitle: Text(weddingDress, style: const TextStyle(fontSize: 20.0)),
              tileColor: Colors.white,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }

}
