import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:money_report/services/screen_size.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return GNav(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.padding20, vertical: ScreenSize.padding10),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home',style: GnavStyle.google,),
          GButton(
            icon: Icons.calculate_outlined,
            text: 'Voti',
            style: GnavStyle.google,
          ),
          GButton(
            icon: Icons.calendar_month_outlined,
            text: 'Calendario',
          ),
          GButton(
            icon: Icons.schedule,
            text: 'Presenze',
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: 'Impostazioni',
          )
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        });
  }
}
