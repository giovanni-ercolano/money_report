import 'package:flutter/material.dart';
import 'package:money_report/services/screen_size.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class RadioListTileTheme extends StatefulWidget {
  const RadioListTileTheme({super.key});

  @override
  State<RadioListTileTheme> createState() => _RadioListTileThemeState();
}

class _RadioListTileThemeState extends State<RadioListTileTheme> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, model, child) {
        return Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: ScreenSize.padding20, bottom: ScreenSize.padding8),
            child: const Text("Imposta il tuo tema",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          RadioListTile<ThemeMode>(
            title: const Text('Modalità Chiara'),
            value: ThemeMode.light,
            groupValue: model.systemTheme
                ? null
                : (model.isDarkMode ? ThemeMode.dark : ThemeMode.light),
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
            groupValue: model.systemTheme
                ? null
                : (model.isDarkMode ? ThemeMode.dark : ThemeMode.light),
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
        ]);
      },
    );
  }
}
