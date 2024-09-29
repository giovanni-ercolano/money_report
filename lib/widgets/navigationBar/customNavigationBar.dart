import 'package:flutter/material.dart';
import 'package:money_report/services/screen_size.dart';
import 'package:money_report/styles/app_color.dart';
import 'package:money_report/widgets/navigationBar/add_transaction_dialog.dart';
import '../../screens/home.dart';
import '../../screens/radar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const Home(),
    const RadarPage(),
    const Text("test3"),
    // const AuthPage(),
    const Text("test4")
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  setBottomBarIndex(index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      print(_screens[_selectedIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: Size(ScreenSize.screenWidth, 80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  backgroundColor: AppColor.primaryBlue,
                  elevation: 0.1,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddTransactionDialog();
                      },
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    size: 35,
                  )),
            ),
            SizedBox(
              width: ScreenSize.screenWidth,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: _selectedIndex == 0
                        ? const Icon(Icons.home, color: AppColor.primaryBlue)
                        : const Icon(
                            Icons.home_outlined,
                            color: AppColor.additionalFour,
                          ),
                    onPressed: () {
                      setBottomBarIndex(0);
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                      icon: _selectedIndex == 1
                          ? const Icon(Icons.radar, color: AppColor.primaryBlue)
                          : const Icon(
                              Icons.radar_outlined,
                              color: AppColor.additionalFour,
                            ),
                      onPressed: () {
                        setBottomBarIndex(1);
                      }),
                  Container(
                    width: ScreenSize.screenWidth * 0.20,
                  ),
                  IconButton(
                      icon: _selectedIndex == 2
                          ? const Icon(Icons.account_balance_wallet,
                              color: AppColor.primaryBlue)
                          : const Icon(
                              Icons.account_balance_wallet_outlined,
                              color: AppColor.additionalFour,
                            ),
                      onPressed: () {
                        setBottomBarIndex(2);
                      }),
                  IconButton(
                      icon: _selectedIndex == 3
                          ? const Icon(Icons.star, color: AppColor.primaryBlue)
                          : const Icon(
                              Icons.star_border,
                              color: AppColor.additionalFour,
                            ),
                      onPressed: () {
                        setBottomBarIndex(3);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColor.primaryLightCyan
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start modificare a 0 per linea dritta o 20 per curva
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width,
        0); //modificare l'ultimo campo a 0 per linea dritta o 20 per curva
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
