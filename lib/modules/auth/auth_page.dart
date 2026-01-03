import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tho_tot/modules/auth/auth_state.dart';
import 'package:tho_tot/modules/auth/login_page.dart';
import 'package:tho_tot/modules/auth/register_page.dart';
import 'auth_controller.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: controller.mode.value == AuthMode.login
                ? const LoginPage()
                : const RegisterPage(),
          );
        }),
      ),
    );
  }
}
