import 'package:flutter/material.dart';
import 'package:vazifa_3/utils/app_constants.dart';
import 'package:vazifa_3/views/widgets/custom_drower.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onbackgroundImageUrl;

  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onbackgroundImageUrl,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();

  bool isDefaultTheme = false;

  void _changeAppBackground() {
    if (isDefaultTheme) {
      setState(() {
        AppConstants.appBarColor = Colors.green;
        AppConstants.scaffoldBackgroundColor = Colors.yellow;
        AppConstants.bodyTextSize = 30;
      });
    } else {
      setState(() {
        AppConstants.appBarColor = Colors.blue;
        AppConstants.scaffoldBackgroundColor = Colors.white;
        AppConstants.bodyTextSize = 14;
      });
    }
    isDefaultTheme = !isDefaultTheme;
  }

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        title: Text(
          "Sozlamalar",
          style: TextStyle(
            fontSize: AppConstants.bodyTextSize,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _changeAppBackground,
            icon: const Icon(
              Icons.color_lens,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              String imageUrl = imageController.text;
              imageController.clear();
              widget.onbackgroundImageUrl(imageUrl);
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
        onbackgroundImageUrl: widget.onbackgroundImageUrl,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppConstants.scaffoldBackgroundColor,
          image: AppConstants.backgroundImageUrl.isEmpty
              ? null
              : DecorationImage(
                  image: NetworkImage(
                    AppConstants.backgroundImageUrl,
                  ),
                ),
        ),
        child: ListView(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: Text(
                "Tungi holat",
                style: TextStyle(
                  fontSize: AppConstants.bodyTextSize,
                ),
              ),
            ),
            TextField(
              controller: imageController,
            ),
          ],
        ),
      ),
    );
  }
}
