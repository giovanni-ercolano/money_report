import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../services/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> logout() async {
    await Auth().signOut();
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, model, child) {
        return SafeArea(
            child: Scaffold(
                body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile<ThemeMode>(
              title: const Text('Modalità Chiara'),
              value: ThemeMode.light,
              groupValue: model.systemTheme ? null : (model.isDarkMode ? ThemeMode.dark : ThemeMode.light),
              onChanged: (value) {
                setState(() {
                  model.lightModeOn();
                  // Qui puoi applicare il tema scelto all'app
                });
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Modalità Scura'),
              value: ThemeMode.dark,
              groupValue: model.systemTheme ? null : (model.isDarkMode ? ThemeMode.dark : ThemeMode.light),
              onChanged: (value) {
                setState(() {
                  model.darkModeOn();
                  // Qui puoi applicare il tema scelto all'app
                });
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Tema di Sistema'),
              value: ThemeMode.system,
              groupValue: model.systemTheme ? ThemeMode.system : null,
              onChanged: (value) {
                setState(() {
                  model.systemThemeOn();
                  // Qui puoi applicare il tema scelto all'app
                });
              },
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () => logout(), child: const Text("Logout")),
            )
          ],
        )));
      },
    );
  }
}
