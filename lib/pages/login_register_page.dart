import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/adminpages/admin.dart';
import 'package:weddingplanner/pages/client/client.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final _formKey = GlobalKey<FormState>();
  final _loginformformKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> registerController = {
    'username': TextEditingController(),
    'firstname': TextEditingController(),
    'lastname': TextEditingController(),
    'age': TextEditingController(),
    'password': TextEditingController(),
    'phoneno': TextEditingController(),
    'email': TextEditingController(),
  };

  String _selectedLocation = "";
  String _selectedGender = "";

  Future<String?> signInWithformdata(String? email, String? password) async {
    String result = "Error";
    try {
      if (email?.trim() == "admin" && password?.trim() == "admin") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Admin()));
      }
      final DocumentReference document =
          FirebaseFirestore.instance.collection("users").doc(email?.trim());
      await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
        if (snapshot.get("password").toString() == password?.trim()) {
          result = 'success';
        } else {
          result = 'Invalid Password';
        }
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
      if (e.toString() ==
          "Bad state: cannot get a field on a DocumentSnapshotPlatform which does not exist") {
        result = "Username is Invalid. Please try again !";
      } else {
        result = e.toString();
      }
    }
    return result;
  }

  Widget loginWidget() {
    return Form(
        key: _loginformformKey,
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['email'],
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some Email';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['password'],
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Valid Password';
                }
                return null;
              },
            ),
          ),
        ]));
  }

  Widget registerWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['email'],
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some Email';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['password'],
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['username'],
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Username';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['firstname'],
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter First Name';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['lastname'],
              decoration: const InputDecoration(
                hintText: 'Last Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Last Name';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['age'],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Age',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Age';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: DropdownButton(
              hint: _selectedGender.isEmpty ? const Text("Please select Gender") : Text(_selectedGender),
              isExpanded: true,
              iconSize: 30.0,
              style: const TextStyle(color: Colors.blue),
              items: ['Male ', 'Female'].map(
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
                    _selectedGender = val!;
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: DropdownButton(
              hint: _selectedLocation.isEmpty ? const Text("Please select Location") : Text(_selectedLocation),
              isExpanded: true,
              iconSize: 30.0,
              style: const TextStyle(color: Colors.blue),
              items: [
                'Bath ',
                'Birmingham ',
                'Bradford ',
                'Brighton & Hove ',
                'Bristol ',
                'Cambridge ',
                'Canterbury ',
                'Carlisle ',
                'Chelmsford ',
                'Chester ',
                'Chichester ',
                'Colchester ',
                'Coventry ',
                'Derby ',
                'Doncaster ',
                'Durham ',
                'Ely ',
                'Exeter ',
                'Gloucester ',
                'Hereford ',
                'Kingston-upon-Hull ',
                'Lancaster ',
                'Leeds ',
                'Leicester ',
                'Lichfield ',
                'Lincoln ',
                'Liverpool ',
                'London ',
                'Manchester ',
                'Milton Keynes ',
                'Newcastle-upon-Tyne ',
                'Norwich ',
                'Nottingham ',
                'Oxford ',
                'Peterborough ',
                'Plymouth ',
                'Portsmouth ',
                'Preston ',
                'Ripon ',
                'Salford ',
                'Salisbury ',
                'Sheffield ',
                'Southampton ',
                'Southend-on-Sea ',
                'St Albans ',
                'Stoke on Trent ',
                'Sunderland ',
                'Truro ',
                'Wakefield ',
                'Wells ',
                'Westminster ',
                'Winchester ',
                'Wolverhampton ',
                'Worcester ',
                'York ',
                'Northern Ireland ',
                'Armagh* ',
                'Bangor ',
                'Belfast ',
                'Lisburn ',
                'Londonderry ',
                'Newry ',
                'Scotland ',
                'Aberdeen* ',
                'Dundee* ',
                'Dunfermline ',
                'Edinburgh* ',
                'Glasgow* ',
                'Inverness ',
                'Perth ',
                'Stirling ',
                'Wales ',
                'Bangor ',
                'Cardiff* ',
                'Newport ',
                'St Asaph ',
                'St Davids ',
                'Swansea ',
                'Wrexham'
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
                    _selectedLocation = val!;
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: TextFormField(
              controller: registerController['phoneno'],
              decoration: const InputDecoration(
                hintText: 'Phone No',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Phone No';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        // _asyncGetOnloadData();
        if (isLogin) {
          if (_loginformformKey.currentState != null) {
            if (_loginformformKey.currentState!.validate()) {
              String? email = registerController['email']?.text ?? "";
              String? password = registerController['password']?.text ?? "";
              signInWithformdata(email, password).then((value) =>
                  value == 'success'
                      ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Client(email: email)))
                      : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(value!),
                        )));
            }
          }
        } else {
          if (_formKey.currentState != null) {
            if (_formKey.currentState!.validate()) {
              String? email = registerController['email']?.text ?? "";
              createUserWithformdata().then((value) => value == 'success'
                  ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Client(
                            email: email,
                          )))
                  : null);
            }
          }
        }
      },
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register User' : 'Login User'),
    );
  }

  Future<String> createUserWithformdata() async {
    try {
      final docuser = FirebaseFirestore.instance
          .collection('users')
          .doc(registerController['email']?.text);
      await docuser.set({
        'email': registerController['email']?.text,
        'password': registerController['password']?.text,
        'username': registerController['username']?.text,
        'firstname': registerController['firstname']?.text,
        'lastname': registerController['lastname']?.text,
        'age': registerController['age']?.text,
        'location': _selectedLocation,
        'phoneno': registerController['phoneno']?.text,
        'gender': _selectedGender,
      });
      return 'success';
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 25.0),
                    isLogin ? 'Login' : 'Register'),
                const SizedBox(height: 80),
                isLogin ? loginWidget() : registerWidget(),
                const SizedBox(height: 20),
                _errorMessage(),
                const SizedBox(height: 50),
                _submitButton(),
                _loginOrRegisterButton()
              ],
            )),
      ),
    );
  }
}
