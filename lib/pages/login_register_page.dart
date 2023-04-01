import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey(); //so we can call snackbar from anywhere
  final _formKey = GlobalKey<FormState>();

  // final List<String> textFieldsValue = []
  final Map<String, TextEditingController> registerController = {
    'username': TextEditingController(),
    'firstname': TextEditingController(),
    'lastname': TextEditingController(),
    'age': TextEditingController(),
    'password': TextEditingController(),
    'location': TextEditingController(),
    'phoneno': TextEditingController(),
    'email': TextEditingController(),
  };

  // final TextEditingController _controllerEmail = TextEditingController();
  // final TextEditingController _controllerPassword = TextEditingController();

  Future<String?> signInWithformdata() async {
    print(registerController['username']?.text);
    try {
      final docuser = FirebaseFirestore.instance.collection('users').doc();
      await docuser.set({
        'username': registerController['username']?.text,
        'firstname': registerController['firstname']?.text,
        'lastname': registerController['lastname']?.text,
        'age': registerController['age']?.text,
        'password': registerController['password']?.text,
        'location': registerController['location']?.text,
        'phoneno': registerController['phoneno']?.text,
        'email': registerController['email']?.text,
      });
      return 'success';
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
      return e.toString();
    }

    // try {
    //   controller: registerController['email'],
    //   // await Auth().signInWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
    // } on FirebaseAuthException catch (e) {
    //   setState(() {
    //     errorMessage = e.message;
    //   });
    // }
  }

  Widget loginWidget() {
    return Column(
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
                return 'Please enter Email';
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
      ],
    );
  }

  Widget registerWidget() {
    List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
    String? _selectedLocation = ""; // Option 2
    String? dropDownValue;

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
            child: TextFormField(
              controller: registerController['gender'],
              decoration: const InputDecoration(
                hintText: 'Gender',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Gender';
                }
                return null;
              },
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 70 / 100,
              child: DropdownButton(
                hint: dropDownValue == null ? const Text('Dropdown') : Text(dropDownValue, style: const TextStyle(color: Colors.blue),
                ),
                isExpanded: true,
                iconSize: 30.0,
                style: const TextStyle(color: Colors.blue),
                items: ['One', 'Two', 'Three'].map((val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(() {
                      dropDownValue = val;
                    },
                  );
                },
              ),
              // TextFormField(
              //   controller: registerController['location'],
              //   decoration: const InputDecoration(
              //     hintText: 'Location',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter Location';
              //     }
              //     return null;
              //   },
              // ),
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
        if (_formKey.currentState != null) {
          if (_formKey.currentState!.validate()) {
            isLogin ? signInWithformdata() : createUserWithformdata();
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
        'location': registerController['location']?.text,
        'phoneno': registerController['phoneno']?.text,
        'gender': registerController['gender']?.text,
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
