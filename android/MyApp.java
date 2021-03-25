import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sms Auto fill',
      theme: ThemeData.light(),
      home: Auth(),
    );
  }
}

class Auth extends StatelessWidget {
  
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              
            ),
            ElevatedButton(
              
            ),
          ],
        ),
      ),
    );
  }
}

