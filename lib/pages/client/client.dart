import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weddingplanner/pages/client/client_dashboard.dart';

import '../login_register_page.dart';

class Client extends StatefulWidget {
  final String email;

  const Client({Key? key, required this.email}) : super(key: key);

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  DateTime selectedDate = DateTime.now();
  String _selectedVenue = "";
  String _selectedCatererValue = "";
  String _selectedStylistValue = "";
  String _selectedWeddingDressValue = "";
  String _selectedLiquorValue = "";
  String _selectedPhotographyValue = "";
  String _selectedHoneymoonValue = "";
  String _selectedWeddingCardValue = "";
  String _selectedWeddingCarValue = "";
  var venueList = [];
  var caterersList = [];
  var stylistsList = [];
  var weddingDressList = [];
  var liquorList = [];
  var photographyList = [];
  var honeyMoonList = [];
  var weddingCardsList = [];
  var weddingCarsList = [];
  late DocumentSnapshot<Map<String, dynamic>> userData;

  Map<String, TextEditingController> registerController = {
    'guestCount': TextEditingController(),
    'venue': TextEditingController(),
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'weddingdate': selectedDate})
        .then((_) => Fluttertoast.showToast(
              msg: "Wedding date saved. please set number of guests",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveGuestCount() async {
    var collection = FirebaseFirestore.instance.collection('users');
    String? guestCount = registerController['guestCount']?.text;
    collection
        .doc(widget.email)
        .update({'guestCount': guestCount})
        .then((_) => Fluttertoast.showToast(
              msg: "Guest Count saved. please select venue.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveVenue() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'venue': _selectedVenue})
        .then((_) => Fluttertoast.showToast(
              msg: "Venue saved. please select Caterer.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveCaterer() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'caterer': _selectedCatererValue})
        .then((_) => Fluttertoast.showToast(
              msg: "Caterer saved. please select Stylist.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveStylist() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'stylist': _selectedStylistValue})
        .then((_) => Fluttertoast.showToast(
              msg: "Stylist saved. please select Wedding Dress.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveWeddingDress() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'weddingDress': _selectedWeddingDressValue})
        .then((_) => Fluttertoast.showToast(
              msg: "Wedding Dress saved. please select Entertainment.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveLiquor() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'liquor': _selectedLiquorValue})
        .then((_) => Fluttertoast.showToast(
              msg: "Liquor saved. please select Photography.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _savePhotography() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'photography': _selectedPhotographyValue})
        .then((_) => Fluttertoast.showToast(
              msg: "Photography saved. please select Honeymoon.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveHoneymoon() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'honeymoon': _selectedHoneymoonValue})
        .then((_) => Fluttertoast.showToast(
              msg: "Honeymoon saved. please select Wedding Cards.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveWeddingCard() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'weddingcard': _selectedWeddingCardValue})
        .then((_) => Fluttertoast.showToast(
              msg: "Wedding Card saved. please select Wedding Car.",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  Future<void> _saveWeddingCar() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(widget.email)
        .update({'weddingcar': _selectedWeddingCarValue})
        .then((_) => Fluttertoast.showToast(
              msg: "Wedding Car saved. ",
              toastLength: Toast.LENGTH_LONG,
            ))
        .catchError((error) => Fluttertoast.showToast(
            msg: 'Failed: $error', toastLength: Toast.LENGTH_LONG));
  }

  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.email)
        .snapshots()
        .listen((snapshot) {
      setState(() {
        userData = snapshot;
        var date = userData.get('weddingdate').toDate();
        selectedDate = date;
        _selectedVenue = userData.get('venue');
        _selectedCatererValue = userData.get('caterer');
        _selectedStylistValue = userData.get('stylist');
        _selectedWeddingDressValue = userData.get('weddingDress');
        _selectedLiquorValue = userData.get('liquor');
        _selectedPhotographyValue = userData.get('photography');
        _selectedHoneymoonValue = userData.get('honeymoon');
        _selectedWeddingCardValue = userData.get('weddingcard');
        _selectedWeddingCarValue = userData.get('weddingcar');
        registerController['guestCount'] =
            TextEditingController(text: userData.get('guestCount'));
      });
    });

    FirebaseFirestore.instance
        .collection('venues')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          venueList.add(element.data()['name']);
        });
      }
    });
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
    FirebaseFirestore.instance
        .collection('stylists')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          stylistsList.add(element.data()['name']);
        });
      }
    });
    FirebaseFirestore.instance
        .collection('liquors')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          liquorList.add(element.data()['name']);
        });
      }
    });
    FirebaseFirestore.instance
        .collection('weddingDresses')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          weddingDressList.add(element.data()['name']);
        });
      }
    });
    FirebaseFirestore.instance
        .collection('photography')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          photographyList.add(element.data()['name']);
        });
      }
    });
    FirebaseFirestore.instance
        .collection('honeyMoons')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          honeyMoonList.add(element.data()['name']);
        });
      }
    });
    FirebaseFirestore.instance
        .collection('weddingCards')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          weddingCardsList.add(element.data()['name']);
        });
      }
    });
    FirebaseFirestore.instance
        .collection('weddingCars')
        .snapshots()
        .listen((snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          weddingCarsList.add(element.data()['name']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  child: const Icon(Icons.logout),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage()))
                  },
                ),
              )
            ],
          ),
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 10);
              });
            },
            controller: _controller,
            children: [
              // Wedding Date
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("${selectedDate.toLocal()}".split(' ')[0],
                        style: const TextStyle(fontSize: 30.0)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('Select Your Wedding Date'),
                    ),
                  ],
                ),
              ),
              // Guests
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: TextFormField(
                        controller: registerController['guestCount'],
                        decoration: const InputDecoration(
                          hintText: 'Enter Guests Count',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Guests Count';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveGuestCount(),
                      child: const Text('Select Set Guest Count'),
                    ),
                  ],
                ),
              ),
              // Venue
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedVenue.isEmpty ? const Text("Please select Venue") : Text(_selectedVenue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: venueList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedVenue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveVenue(),
                      child: const Text('Select Venue'),
                    ),
                  ],
                ),
              ),
              // Caterer
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedCatererValue.isEmpty ? const Text("Please select Caterer") : Text(_selectedCatererValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: caterersList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedCatererValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveCaterer(),
                      child: const Text('Select Caterer'),
                    ),
                  ],
                ),
              ),
              // Stylist
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedStylistValue.isEmpty ? const Text("Please select Stylist") : Text(_selectedStylistValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: stylistsList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedStylistValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveStylist(),
                      child: const Text('Select Stylist'),
                    ),
                  ],
                ),
              ),
              // Wedding Dress
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedWeddingDressValue.isEmpty ? const Text("Please select a Wedding Dress") : Text(_selectedWeddingDressValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: weddingDressList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedWeddingDressValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveWeddingDress(),
                      child: const Text('Select Wedding Dress'),
                    ),
                  ],
                ),
              ),
              // Liquor
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedLiquorValue.isEmpty ? const Text("Please select Liquor Type") : Text(_selectedLiquorValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: liquorList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedLiquorValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveLiquor(),
                      child: const Text('Select Liquor'),
                    ),
                  ],
                ),
              ),
              // Photography
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedPhotographyValue.isEmpty ? const Text("Please select a Photographer") : Text(_selectedPhotographyValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: photographyList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedPhotographyValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _savePhotography(),
                      child: const Text('Select Photography'),
                    ),
                  ],
                ),
              ),
              // Honey moon
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedHoneymoonValue.isEmpty ? const Text("Please select a Honeymoon Suite") : Text(_selectedHoneymoonValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: honeyMoonList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedHoneymoonValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveHoneymoon(),
                      child: const Text('Select Honeymoon'),
                    ),
                  ],
                ),
              ),
              // Wedding Card
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedWeddingCardValue.isEmpty ? const Text("Please select a WeddingCard") : Text(_selectedWeddingCardValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: weddingCardsList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedWeddingCardValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveWeddingCard(),
                      child: const Text('Select Wedding Card'),
                    ),
                  ],
                ),
              ),
              // Wedding Car
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: DropdownButton(
                        hint: _selectedWeddingCarValue.isEmpty ? const Text("Please select a WeddingCar") : Text(_selectedWeddingCarValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: weddingCarsList.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedWeddingCarValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () => _saveWeddingCar(),
                      child: const Text('Select Wedding Car'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () => {_controller.jumpToPage(10)},
                    child: const Text('Skip')),
                SmoothPageIndicator(controller: _controller, count: 11),
                onLastPage
                    ? GestureDetector(
                        onTap: () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return ClientDashboard(email: widget.email);
                              }))
                            },
                        child: const Text('Done'))
                    : GestureDetector(
                        onTap: () => {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeOut)
                            },
                        child: const Text('Next')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
