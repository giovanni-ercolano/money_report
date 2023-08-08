import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_report/providers/theme_provider.dart';
import 'package:money_report/styles/app_theme.dart';
import 'package:money_report/widgets/customNavigationBar.dart';
import 'package:provider/provider.dart';
import 'styles/app_color.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  final themeModel = ThemeModel();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>.value(value: themeModel),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        final isDarkMode = themeModel.isDarkMode;
        final statusBarColor =
            isDarkMode ? AppColor.additionalSix : AppColor.additionalOne;
        final statusBarIconBrightness =
            isDarkMode ? Brightness.light : Brightness.dark;

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: statusBarColor,
            statusBarIconBrightness: statusBarIconBrightness,
          ),
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Money Report',
          theme: getThemeData(themeModel.isDarkMode, Brightness.light),
          darkTheme: getThemeData(themeModel.isDarkMode, Brightness.dark),
          // home: const CustomBottomNavigationBar(),
          initialRoute: '/',
          routes: {
            '/': (context) => const CustomBottomNavigationBar(),
          },
        );
      },
    );
  }
}
