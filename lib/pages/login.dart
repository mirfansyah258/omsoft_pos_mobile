import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/components/MyTextField.dart';
import 'package:omsoft_pos_mobile/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();

    initSharedPrefs();
  }

  void initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async{
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){

      var reqBody = {
        "username":_emailController.text,
        "password":_passwordController.text
      };

      try {
        var response = await http.post(Uri.parse(loginUrl),
            headers: {"Content-Type":"application/json"},
            body: jsonEncode(reqBody)
        );

        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var username = jsonResponse['data']['username'];
          var firstName = jsonResponse['data']['first_name'];
          var lastName = jsonResponse['data']['last_name'];
          var token = jsonResponse['data']['token'];

          prefs.setString('username', username);
          prefs.setString('firstName', firstName);
          prefs.setString('lastName', lastName);
          prefs.setString('token', token);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(token: myToken)));
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          print('Login failed');
          var errorMsg = jsonResponse['errors'];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMsg)),
          );

        }
      } catch (err) {
        print('error http');
        print(err.toString());
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
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.blue[100],
      body: SafeArea(
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
                    Image.asset('assets/images/cat.png'),
                    const Text(
                      'Kucing Peduli',
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
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Password',
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                        ]
                    ),
                    const SizedBox(height: 50),
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
                        // backgroundColor: Colors.blue,
                          foregroundColor: Colors.yellow,
                          padding: EdgeInsets.zero,
                          minimumSize: const Size.fromHeight(50),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                      ),
                      child: const Text('Submit'),
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

  bool isValidEmail(String email) {
    // You can implement a more robust email validation logic if needed
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
  }
}
