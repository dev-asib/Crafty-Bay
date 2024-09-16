import 'package:crafty_bay/Presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/Presentation/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              SearchTextField(textEditingController: TextEditingController()),
              const SizedBox(height: 16),
              const HomeBannerSlider(),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
              _buildPopularProductSection(),
              const SizedBox(height: 16),
              _buildNewProductSection(),
              const SizedBox(height: 16),
              _buildSpecialProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(
            title: 'Category',
            onTap: () {
              Get.find<MainBottomNavController>().selectCategory();
            }),
        const SizedBox(height: 8),
        const SizedBox(
          height: 120,
          child: HorizontalCategoryListView(),
        ),
      ],
    );
  }

  Widget _buildPopularProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'Popular', onTap: () {}),
        const SizedBox(height: 8),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
        ),
      ],
    );
  }

  Widget _buildNewProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'New', onTap: () {}),
        const SizedBox(height: 8),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
        ),
      ],
    );
  }

  Widget _buildSpecialProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'Special', onTap: () {}),
        const SizedBox(height: 8),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const AppLogoNavWidget(),
      actions: [
        AppBarIcon(
          iconData: Icons.person,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIcon(
          iconData: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIcon(
          iconData: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
