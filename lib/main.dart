import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:money_report/providers/theme_provider.dart';
import 'package:money_report/styles/app_theme.dart';
import 'package:money_report/widgets/navigationBar/customNavigationBar.dart';
import 'package:provider/provider.dart';
import 'screens/auth.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: "config_flutter.env");

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> isNetworkAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    // print(connectivityResult);
    return true;
  }

  @override
  void initState() {
    super.initState();
    context.read<ThemeModel>().initializeSystemThemeListener();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        FlutterNativeSplash.remove();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Money Report',
          theme: getThemeData(themeModel.isDarkMode, Brightness.light),
          darkTheme: getThemeData(themeModel.isDarkMode, Brightness.dark),
          // home: const CustomBottomNavigationBar(),
          // initialRoute: '/',
          // routes: {
          //   '/': (context) => const CustomBottomNavigationBar(),
          // },
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return const CustomBottomNavigationBar();
              } else {
                return const AuthPage();
              } // Aggiungi un indicatore di caricamento durante la connessione
            },
          ),
        );
      },
    );
  }
}
