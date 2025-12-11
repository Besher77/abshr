import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/login_repository.dart';
import '../../../routes/app_routes.dart';

/// Login controller
/// Handles logic and validation only
class LoginController extends GetxController {
  final LoginRepository _repository = LoginRepository();

  // Form fields
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Password visibility
  final isPasswordVisible = false.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Handle login button press
  /// No validation, just navigate to home
  Future<void> login() async {
    await _repository.login(
      usernameController.text,
      passwordController.text,
    );
    final redirect = Get.arguments is Map<String, dynamic>
        ? (Get.arguments['redirect'] as String?)
        : null;
    Get.toNamed(
      redirect ?? AppRoutes.home,
      arguments: Get.arguments,
    );
  }
}

