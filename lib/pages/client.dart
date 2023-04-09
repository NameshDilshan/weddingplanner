import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weddingplanner/pages/client_dashboard.dart';

import 'login_register_page.dart';

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

  final Map<String, TextEditingController> registerController = {
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
                  child: const Icon( Icons.logout ),
                  onTap: () => {
                    Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => const LoginPage()))
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
                        hint: Text(_selectedVenue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items:
                            ['Bath ', 'St Davids ', 'Swansea ', 'Wrexham'].map(
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
                        hint: Text(_selectedCatererValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: ['cat1 ', 'St vat2 ', 'cat3 ', 'Wrexham'].map(
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
                        hint: Text(_selectedStylistValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: ['style1 ', 'style2', 'style3'].map(
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
                        hint: Text(_selectedWeddingDressValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: [
                          'Wed dress1',
                          'Wed dress2',
                          'Wed dress3',
                          'Wed dress4'
                        ].map(
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
                        hint: Text(_selectedLiquorValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: ['Liq1', 'Liq2', 'Liq3', 'Liq4'].map(
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
                        hint: Text(_selectedPhotographyValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: ['photo1 ', 'photo2', 'photo3', '4'].map(
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
                        hint: Text(_selectedHoneymoonValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: ['honey1', 'honey2', 'honey3', 'honey4'].map(
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
                        hint: Text(_selectedWeddingCardValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: ['Card1', 'Card2', 'Card3', 'Card4'].map(
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
                        hint: Text(_selectedWeddingCarValue),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.blue),
                        items: ['Car1', 'Car2', 'Car3', 'Car4'].map(
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
                                  return const ClientDashboard();
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
              ))
        ],
      ),
    );
  }
}
