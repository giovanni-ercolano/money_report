import 'package:flutter/material.dart';
import 'package:money_report/providers/theme_provider.dart';
import 'package:money_report/widgets/tab_bar_view.dart';
import 'package:provider/provider.dart';

import '../services/screen_size.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.padding20,
                vertical: ScreenSize.padding10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("****6803", style: TextStyle(fontSize: 16)),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () => {},
                      icon: const Icon(Icons.account_circle),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: const [
                      Text(
                        "Total Balance:",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        " \$48,560",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenSize.padding8,
                ),
                SizedBox(
                  height: ScreenSize.screenHeight * 0.4,
                  child: const MyTabBarView(),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
