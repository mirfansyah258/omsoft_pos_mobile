import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:omsoft_pos_mobile/components/MyTextField.dart';
import 'package:omsoft_pos_mobile/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // final _db = FirebaseFirestore.instance;

  late SharedPreferences prefs;
  String ipAddress = "";

  @override
  void initState() {
    super.initState();

    initSharedPrefs();
  }

  Future<void> fetchIPAddress() async {
    try {
      final response = await http.get(Uri.parse('https://httpbin.org/ip'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          ipAddress = data['origin'];
        });
      } else {
        setState(() {
          ipAddress = "Failed to fetch IP";
        });
      }
    } catch (e) {
      setState(() {
        ipAddress = "Error: $e";
      });
    }
  }

  void initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async{
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){

      await Future.delayed(const Duration(seconds: 1));
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        }
      );

      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
        ).whenComplete(() async {
          // await _db.collection("Users").add({
          //   "email": _emailController.text,
          //   "ipAddress": ipAddress,
          //   "origin": "unknown"
          // });

          Navigator.pop(context);
        });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        print('error msg ${e.message}');
        print('error code ${e.code}');
        var msg = 'Error SignIn';
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          setState(() {
            msg = 'No user found for that email.';
          });
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          setState(() {
            msg = 'Wrong password provided for that user.';
          });
        } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          print('INVALID_LOGIN_CREDENTIALS');
          setState(() {
            msg = 'Invalid Login Credentials.';
          });
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
                minWidth: viewportConstraints.maxWidth,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // login logo
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Image.asset('assets/images/cat.png', scale: 1.5,),
                          SizedBox(height: 10,),
                          const Text(
                            appName,
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ),
                    // form input
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          // Email input form
                          MyTextField(
                            label: 'Email',
                            isRequired: true,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (!isValidEmail(value)) {
                                return 'Invalid email address';
                              }
                              return null;
                            },
                          ),

                          // Password input form
                          MyTextField(
                            label: 'Password',
                            isRequired: true,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true
                          ),

                          const SizedBox(height: 25),

                          // Submit button
                          FilledButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // You can now use _email and _password for authentication
                                // For this example, we'll just print them
                                print('Email: ${_emailController.text}');
                                print('Password: ${_passwordController.text}');

                                // Navigator.of(context).pushReplacementNamed('/home');
                                loginUser();
                              }
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: darkBlue,
                              foregroundColor: yellow,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size.fromHeight(50),
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                            ),
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // You can implement a more robust email validation logic if needed
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
  }
}
