import 'package:e_rtlh_mobile/core/utils/colors.dart';
import 'package:e_rtlh_mobile/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/menu_model.dart';

class MenuGrid extends StatelessWidget {
  final List<MenuModel> menus;

  const MenuGrid({super.key, required this.menus});

  IconData _mapIcon(String name) {
    switch (name) {
      case "list":
        return Icons.history;
      case "manage":
        return Icons.settings;
      case "users":
        return Icons.people;
      case "image":
        return Icons.image;
      case "announcement":
        return Icons.campaign;
      case "news":
        return Icons.article;
      case "profile":
        return Icons.person;
      default:
        return Icons.circle; // default
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menus.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (_, index) {
        final menu = menus[index];

        return GestureDetector(
          onTap: () => Get.toNamed(menu.route),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Icon(
                  _mapIcon(menu.icon),
                  size: 40,
                  color: colorPrimary,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                menu.title,
                textAlign: TextAlign.center,
                style: selectedMainMenuStyle
              )
            ],
          ),
        );
      },
    );
  }
}
