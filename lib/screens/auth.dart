import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_report/models/users/user_model.dart';
import 'package:money_report/services/screen_size.dart';
//firebase
import '../services/firebase_auth.dart';
import '../services/firebase_db.dart';
import '../widgets/auth/login_icon_buttons.dart';

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
  bool _showPassword = false;
  late bool _isLoginForm = true;

  Future<void> signIn() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        // Do something :D
      }
    }
  }

  Future<bool> createAccount() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
      return true;
    } on FirebaseAuthException {}
    return false;
  }

  Future<void> accountOnDb(user) async {
    await FirebaseDb().createUsers(user);
  }

  getUserUid() {
    return Auth().getUser().uid;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(ScreenSize.padding20),
          child: SingleChildScrollView(
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: ScreenSize.screenHeight * 0.25),
                  Padding(
                    padding: EdgeInsets.only(bottom: ScreenSize.padding30),
                    child: const Text(
                      "Money Report",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter your username',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: ScreenSize.padding20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  if (!_isLoginForm) SizedBox(height: ScreenSize.padding20),
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
                  SizedBox(height: ScreenSize.padding20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_isLoginForm) {
                          await signIn();
                        } else {
                          final success = await createAccount();
                          if (success) {
                            final user = UserModel(
                                uid: getUserUid(),
                                email: _usernameController.text.trim());
                            await accountOnDb(user);
                          } else {
                            // Gestisci il caso in cui la creazione dell'account non abbia avuto successo.
                          }
                        }
                      }
                    },
                    child: Text(
                      _isLoginForm ? 'Log In' : 'Create Account',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: ScreenSize.padding30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Expanded(
                        child: Divider(
                            indent: 16,
                            endIndent:
                                8), // Imposta la lunghezza del Divider a sinistra
                      ),
                      Text('or', style: TextStyle(fontSize: 20)),
                      Expanded(
                        child: Divider(
                            indent: 8,
                            endIndent:
                                16), // Imposta la lunghezza del Divider a destra
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.padding30),
                  const LoginIconButtons(),
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
      ),
    );
  }
}
