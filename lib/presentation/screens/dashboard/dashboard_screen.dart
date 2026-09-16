// ignore_for_file: library_private_types_in_public_api

import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/presentation/screens/cart/cart_screen.dart';
import 'package:apple_shop_ir/presentation/screens/category/category_screen.dart';
import 'package:apple_shop_ir/presentation/screens/home/home_screen.dart';
import 'package:apple_shop_ir/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightGrey,
      body: _screens[_currentIndex],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return ClipRRect(
      child: BackdropFilter(
        filter: .blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white30),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colours.darkGrey,
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'SM',
              fontSize: 12,
              color: Colours.darkGrey,
            ),
            selectedLabelStyle: TextStyle(
              fontFamily: 'SM',
              fontSize: 12,
              color: Colours.darkBlue,
            ),
            selectedItemColor: Colours.darkBlue,
            type: .fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home_1),
                activeIcon: Icon(Iconsax.home5),
                label: 'خانه',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.category),
                activeIcon: Icon(Iconsax.category5),
                label: 'دسته‌بندی',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.bag_2),
                activeIcon: Padding(
                  padding: .only(left: 24),
                  child: Icon(Iconsax.bag_25),
                ),
                label: 'سبدخرید',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.user),
                activeIcon: Icon(Iconsax.user_tick, size: 24),
                label: 'حساب‌کابری',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
