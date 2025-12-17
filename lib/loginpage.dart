import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  List users = [];

  void login() {
    String user = userController.text;
    String pass = passController.text;

    for (var u in users) {
      if (u['user'] == user && u['pass'] == pass) {
        showMsg('Login OK');
        return;
      }
    }
    showMsg('Login Failed');
  }

  void register() {
    String user = userController.text;
    String pass = passController.text;

    if (user.isEmpty || pass.isEmpty) {
      showMsg('Enter user and pass');
      return;
    }

    users.add({'user': user, 'pass': pass});
    showMsg('User Added');
    userController.clear();
    passController.clear();
  }

  void showMsg(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login App')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(onPressed: login, child: Text('Login')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: register, child: Text('Register')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}