import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/nav_provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navProvider = Provider.of<NavbarViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: navProvider.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: navProvider.pages,
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                rippleColor: Colors.grey.shade300,
                hoverColor: Colors.grey.shade100,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 300),
                tabBackgroundColor: Colors.grey.shade100,
                tabs: [
                  GButton(
                    icon: Icons.home_rounded,
                    text: 'Home',
                    iconActiveColor: Colors.blue,
                  ),
                  GButton(
                    icon: Icons.list_alt_rounded,
                    text: 'Transactions',
                    iconActiveColor: Colors.blue,
                  ),
                  GButton(
                    icon: Icons.abc_rounded,
                    text: 'Coins',

                    // textColor: navyBlue,
                  ),
                ],
                selectedIndex: 0,
                onTabChange: (index) {
                  navProvider.changeIndex(index);
                  navProvider.pageController.jumpToPage(index);
                  // setState(() {
                  //   _selectedIndex = index;
                  // });
                }),
          ),
        ),
      ),
    );
  }
}
