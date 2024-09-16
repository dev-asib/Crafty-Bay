import 'package:crafty_bay/Presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/Presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (dipPop, result) {
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Categories"),
        ),
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return const CategoryCard(
              iconData: Icons.computer,
              label: "Electronics",
            );
          },
        ),
      ),
    );
  }

  void backToHome() {
    Get.find<MainBottomNavController>().backToHome();
  }
}