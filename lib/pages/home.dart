import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? username;
  String? firstName;
  String? lastName;
  String? token;
  bool isLoading = true;

  Future getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    print('token:');
    print(token);
    await Future.delayed(const Duration(seconds: 1));
    if (token == null) {
      goToLoginPage();
    }
    setState(() {
      isLoading = false;
    });

    username = pref.getString("username");
    firstName = pref.getString("firstName");
    lastName = pref.getString("lastName");
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    goToLoginPage();
  }

  void goToLoginPage() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Login(title: 'Login'),
      ),
          (route) => false,
    );
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator(),) : LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
                minWidth: viewportConstraints.maxWidth,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('username: $username'),
                      Text('firstName: $firstName'),
                      Text('lastName: $lastName'),
                      Text('token: $token'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FilledButton(
                          onPressed: () {
                            print('Logout');
                            logout();
                          },
                          child: const Text('Logout')
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
