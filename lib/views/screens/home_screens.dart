import 'package:flutter/material.dart';
import 'package:vazifa_3/utils/app_constants.dart';
import 'package:vazifa_3/views/widgets/custom_drower.dart';
import 'package:vazifa_3/views/widgets/pincode_widget.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onbackgroundImageUrl;
  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onbackgroundImageUrl,
    required toggleThemeMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bosh Sahifa",
          style: TextStyle(
            fontSize: AppConstants.bodyTextSize,
          ),
        ),
        backgroundColor: AppConstants.appBarColor,
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
        child: const PinCodeScreen(),
      ),
    );
  }
}
