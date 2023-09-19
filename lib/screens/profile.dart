import 'package:flutter/material.dart';
import 'package:money_report/services/screen_size.dart';
import 'package:money_report/styles/app_color.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../services/firebase_auth.dart';
import '../widgets/profile/radio_list_tile_theme.dart';

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
          children: [
            Row(children: [
              IconButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  icon: const Icon(Icons.arrow_back)),
            ]),
            IconButton(
              icon: model.isDarkMode
                  ? const Icon(Icons.nightlight_round)
                  : const Icon(Icons.wb_sunny_rounded),
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
                  context: context,
                  builder: (context) {
                    return Container(
                      height: ScreenSize.screenHeight /
                          2.9, // Altezza desiderata del bottom sheet
                      decoration: BoxDecoration(
                        color: model.isDarkMode
                            ? AppColor.additionalSix
                            : AppColor.additionalOne,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child:
                          const RadioListTileTheme(), // Il tuo widget personalizzato
                    );
                  },
                );
              },
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(ScreenSize.padding10),
                child: ElevatedButton(
                    onPressed: () => logout(), child: const Text("Logout")),
              ),
            )
          ],
        )));
      },
    );
  }
}
