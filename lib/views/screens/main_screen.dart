import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/views/screens/account_screen.dart';
import 'package:shop_app/views/screens/cart_screen.dart';
import 'package:shop_app/views/screens/category_screen.dart';
import 'package:shop_app/views/screens/favorite_screen.dart';
import 'package:shop_app/views/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        selectedItemColor: Colors.pink,
        currentIndex: pageIndex,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/store-1.png',
                width: 20,
              ),
              label: 'HOME'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/explore.svg',
                width: 20,
              ),
              label: 'CATEGORIES'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/cart.svg',
                width: 20,
              ),
              label: 'CART'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/favorite.svg',
                width: 20,
              ),
              label: 'FAVORITE'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/account.svg',
                width: 20,
              ),
              label: 'ACCOUNT'),
        ],
      ),
      body: _pages[pageIndex],
    );
  }
}
