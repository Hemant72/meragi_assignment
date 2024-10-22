import 'package:flutter/material.dart';
import 'package:meragi_assignment/src/auth/presentation/pages/desktop_page.dart';
import 'package:meragi_assignment/src/auth/presentation/pages/mobile_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            // If the screen is wider than 768px, show the desktop layout
            return const DesktopLoginPage();
          } else {
            // Otherwise, show the mobile layout
            return const MobileLoginPage();
          }
        },
      ),
    );
  }
}
