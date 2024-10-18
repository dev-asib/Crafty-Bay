import 'package:crafty_bay/Presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay/Presentation/ui/widgets/user_profile/user_information_view.dart';
import 'package:crafty_bay/Presentation/ui/widgets/user_profile/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildProfileSection(textTheme),
              const SizedBox(height: 24),
              _buildTabBarAndTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarAndTabBarView() {
    return const Expanded(
      child: Column(
        children: [
          TabBar(
            tabs: [
              Text("Information"),
              Text("Edit"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                UserInformationView(),
                EditProfileView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(TextTheme textTheme) {
    return Column(
      children: [
        _buildProfileImage(),
        const SizedBox(height: 8),
        _buildProfileBottom(
          textTheme: textTheme,
          userName: "Dev Asib",
          phoneNumber: "01777777777",
        ),
      ],
    );
  }

  Widget _buildProfileBottom(
      {required TextTheme textTheme,
      required String userName,
      required String phoneNumber}) {
    return Column(
      children: [
        Text(
          userName,
          style: textTheme.titleLarge,
        ),
        Text(
          phoneNumber,
          style: textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AssetsPath.dummyProfile),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
