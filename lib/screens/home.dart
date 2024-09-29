import 'package:flutter/material.dart';
import 'package:money_report/models/transactions/transaction_model.dart';
import 'package:money_report/models/users/user_controller.dart';
import 'package:money_report/providers/theme_provider.dart';
import 'package:money_report/screens/profile.dart';
import 'package:money_report/widgets/home/tab_bar_view.dart';
import 'package:provider/provider.dart';
import '../models/users/user_model.dart';
import '../services/screen_size.dart';
import '../widgets/home/home_category_list.dart';
import '../widgets/shimmer_widgets/shimmer_home_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  void _openProfilePage(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.padding20,
                  vertical: ScreenSize.padding10),
              child: FutureBuilder(
                future: UserController.instance.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel userData = snapshot.data as UserModel;
                      List<TransactionModel>? transactionList =
                          userData.transactions;
                      print(
                          "lunghezza transazioni: ${userData.transactions?.length}");

                      return Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userData.email,
                                  style: const TextStyle(fontSize: 16)),
                              Expanded(child: Container()),
                              IconButton(
                                onPressed: () => _openProfilePage(context),
                                icon: const Icon(Icons.account_circle),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                const Text(
                                  "Total Balance:",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text('\$${userData.assets ?? 0.0}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.padding8,
                          ),
                          // Verifica se i dati sono pronti prima di visualizzare il widget
                          SizedBox(
                            height: ScreenSize.screenHeight * 0.52,
                            child: const MyTabBarView(),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight * 0.4,
                            child: HomeCategoryList(data: userData),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(child: Text("Loading..."));
                    }
                  } else {
                    return const ShimmerHomeWidget();
                  }
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
