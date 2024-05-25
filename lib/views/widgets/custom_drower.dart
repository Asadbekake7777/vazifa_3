import 'package:flutter/material.dart';
import 'package:vazifa_3/utils/app_constants.dart';
import 'package:vazifa_3/views/screens/home_screens.dart';
import 'package:vazifa_3/views/screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onbackgroundImageUrl;
  const CustomDrawer({
    super.key,
    required this.onThemeChanged,
    required this.onbackgroundImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.appBarColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Mehmonxonalar",
                  style: TextStyle(
                    fontSize: AppConstants.bodyTextSize,
                  ),
                ),
                Text(
                  "MENYU",
                  style: TextStyle(
                    fontSize: AppConstants.bodyTextSize,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen(
                      onThemeChanged: onThemeChanged,
                      onbackgroundImageUrl: onbackgroundImageUrl,
                      toggleThemeMode: null,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Bosh sahifa",
              style: TextStyle(
                fontSize: AppConstants.bodyTextSize,
              ),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                      onThemeChanged: onThemeChanged,
                      onbackgroundImageUrl: onbackgroundImageUrl,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Sozlamalar",
              style: TextStyle(
                fontSize: AppConstants.bodyTextSize,
              ),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
