import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weddingplanner/models/User.dart';
import '../auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  final GlobalKey _formKey = GlobalKey<FormState>();
  final List<String> textFieldsValue = [];

  // final TextEditingController _controllerEmail = TextEditingController();
  // final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithformdata() async {
    try {
      // await Auth().signInWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 70 / 100,
          child: TextFormField(
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
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 70 / 100,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some Email';
              }
              textFieldsValue.add(value!);
            },
          ),
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 70 / 100,
        //   child: TextFormField(
        //     decoration: const InputDecoration(
        //       hintText: 'Password',
        //     ),
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Please enter Password';
        //       }
        //     },
        //   ),
        // ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 70 / 100,
        //   child: TextFormField(
        //     decoration: const InputDecoration(
        //       hintText: 'Username',
        //     ),
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Please enter Username';
        //       }
        //       return null;
        //     },
        //   ),
        // ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 70 / 100,
        //   child: TextFormField(
        //     decoration: const InputDecoration(
        //       hintText: 'First Name',
        //     ),
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Please enter First Name';
        //       }
        //       return null;
        //     },
        //   ),
        // ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 70 / 100,
        //   child: TextFormField(
        //     decoration: const InputDecoration(
        //       hintText: 'Last Name',
        //     ),
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Please enter Last Name';
        //       }
        //       return null;
        //     },
        //   ),
        // ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 70 / 100,
        //   child: TextFormField(
        //     keyboardType: TextInputType.number,
        //     decoration: const InputDecoration(
        //       hintText: 'Age',
        //     ),
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Please enter Age';
        //       }
        //       return null;
        //     },
        //   ),
        // ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 70 / 100,
        //   child: TextFormField(
        //     decoration: const InputDecoration(
        //       hintText: 'Location',
        //     ),
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Please enter Location';
        //       }
        //       return null;
        //     },
        //   ),
        // ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 70 / 100,
        //   child: TextFormField(
        //     decoration: const InputDecoration(
        //       hintText: 'Phone No',
        //     ),
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Please enter Phone No';
        //       }
        //       return null;
        //     },
        //   ),
        // ),
      ],
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
          isLogin ? signInWithformdata() : createUserWithformdata();
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

  Future<void> createUserWithformdata() async {
    // try {
      print(textFieldsValue.length);
      final docuser = FirebaseFirestore.instance.collection('users').doc();
      // final user = User(
      // id: docuser.id,
      // username: username, firstname: firstname, lastname: lastname, age: age, password: password, location: location, phoneno: phoneno)
      // await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
    // } on FirebaseAuthException catch (e) {
    //   setState(() {
    //     errorMessage = e.message;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
