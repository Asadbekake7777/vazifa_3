// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool _isPinValid = true;

  var SharedPreferences;

  var changeBackgroundImage;

  @override
  void initState() {
    super.initState();
    _loadPin();
  }

  Future<void> _loadPin() async {
    final prefs = await SharedPreferences.getInstance();
    final pinCode = prefs.getString('pinCode') ?? '';
    if (pinCode.isNotEmpty) {
      _pinController.text = pinCode;
    }
  }

  Future<void> _savePin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pinCode', _pinController.text);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PIN Kodini Kiriting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'PIN Kod',
                errorText: _isPinValid ? null : 'PIN noto\'g\'ri',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final savedPinCode = prefs.getString('pinCode') ?? '';
                if (_pinController.text == savedPinCode) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  setState(() {
                    _isPinValid = false;
                  });
                }
              },
              child: const Text('Kirish'),
            ),
            ElevatedButton(
              onPressed: _savePin,
              child: const Text('PINni Saqlash'),
            ),
          ],
        ),
      ),
    );
  }
}
