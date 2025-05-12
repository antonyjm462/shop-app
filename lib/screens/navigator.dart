import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/screens/bag/bag_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';

class MainNavigator extends StatefulWidget {
  final int initialIndex;
  const MainNavigator({super.key, this.initialIndex = 0});
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  late PageController _pageController;
  late int _selectedIndex;

  late List<Widget> _screen;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _screen = [HomeScreen(), MyBagScreen(onBack: () => _onItemTapped(0))];
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: _screen,
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 27.0,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: AppConstantsColor.unSelectedTextColor,
        backgroundColor: AppConstantsColor.backgroundColor,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          CustomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart)),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
