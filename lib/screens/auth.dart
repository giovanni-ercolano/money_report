import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_report/services/screen_size.dart';
//firebase
import '../services/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoginForm = true;

  Future<void> signIn() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        // Do something :D
        print('That email address is invalid!');
      }
    }
  }

  Future<void> createAccount() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException {}
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(ScreenSize.padding10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenSize.padding10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenSize.padding10),
                if (!_isLoginForm)
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      hintText: 'Confirm your password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords must match';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: ScreenSize.padding10),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_isLoginForm) {
                        await signIn();
                      } else {
                        await createAccount();
                      }
                    }
                  },
                  child: Text(_isLoginForm ? 'Login' : 'Create Account'),
                ),
                SizedBox(height: ScreenSize.padding10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLoginForm = !_isLoginForm;
                    });
                  },
                  child: Text(_isLoginForm
                      ? 'Create an account'
                      : 'Already have an account?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
