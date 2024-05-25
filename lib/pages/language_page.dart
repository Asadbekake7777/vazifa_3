import 'package:flutter/material.dart';

class LanguagePages extends StatefulWidget {
  final ValueChanged<String> onLanguageChanged;

  const LanguagePages({
    super.key,
    required this.onLanguageChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LanguagePagesState createState() => _LanguagePagesState();
}

class _LanguagePagesState extends State<LanguagePages> {
  String _selectedLanguage = 'Uzbek';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bosh Sahifa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tilni tanlang:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                  widget.onLanguageChanged(newValue);
                });
              },
              items: <String>['Uzbek', 'English', 'Russian']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
