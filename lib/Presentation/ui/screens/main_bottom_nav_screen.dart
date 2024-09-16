import 'package:crafty_bay/Presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/Presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/category_list_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/Presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavController _mainBottomNavController =
      Get.find<MainBottomNavController>();

  List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (_) {
        return Scaffold(
          body: _screens[_mainBottomNavController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: _mainBottomNavController.selectedIndex,
            onDestinationSelected: _mainBottomNavController.changeIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.category), label: "Category"),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              NavigationDestination(
                  icon: Icon(Icons.favorite_outline), label: "WishList"),
            ],
          ),
        );
      },
    );
  }
}
