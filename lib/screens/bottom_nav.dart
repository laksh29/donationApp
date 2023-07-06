import 'package:donationsapp/screens/form.dart';
import 'package:donationsapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int count = 0;
  final screens = const [
    HomeScreen(),
    DonationForm(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[count],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        currentIndex: count,
        onTap: (index) => setState(() {
          count = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.noteSticky), label: "Donation Form")
        ],
        selectedItemColor: Colors.teal,
        elevation: 0,
      ),
    );
  }
}
