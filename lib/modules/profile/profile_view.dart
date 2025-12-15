import 'package:e_rtlh_mobile/core/utils/colors.dart';
import 'package:e_rtlh_mobile/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/assetes.dart';
import 'profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: colorPrimary,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Obx(() => profileController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : _profileHeader()),
            const SizedBox(height: 20),
            _menuSection(),
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage(
                PROFILE, // ganti dari API
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: colorPrimary,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        Text(
          profileController.user.value.name ?? '',
          style: titleStyle,
        ),
        const SizedBox(height: 4),
        Text(
          profileController.user.value.phone ?? '',
          style: labelTitleStyle,
        ),
        const SizedBox(height: 4),
        Text(
          profileController.user.value.email ?? '',
          style: labelTitleStyle,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            (profileController.user.value.role ?? '').toUpperCase(),
            style: TextStyle(color: colorPrimary),
          ),
        ),
      ],
    );
  }

  Widget _menuSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _menuItem(
            icon: Icons.edit,
            title: "Edit Profile",
            color: colorPrimary,
            onTap: () {},
          ),
          _divider(),
          _menuItem(
            icon: Icons.lock,
            title: "Ganti Password",
            color: colorPrimary,
            onTap: () {},
          ),
          _divider(),
          _menuItem(
            icon: Icons.info,
            title: "Tentang E-RTLH Jambi",
            color: colorPrimary,
            onTap: () {},
          ),
          _divider(),
          _menuItem(
            icon: Icons.logout,
            title: "Logout",
            color: Colors.red,
            onTap: () {
              profileController.logout();
            },
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    Color color = Colors.black,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _divider() {
    return Divider(height: 1, color: Colors.grey.shade300);
  }
}
