import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/theme_helper.dart';
import '../controllers/login_controller.dart';

/// Login view - UI only
/// Matches the design 100%
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final args = Get.arguments;
    final role = args is Map<String, dynamic> ? args['role'] as String? : null;
    final primaryColor = ThemeHelper.getPrimaryColor(role);
    final borderFocusColor = ThemeHelper.getBorderFocusColor(role);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.paddingXL * 2),
                
                // Title
                Text(
                  'login_title'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                
                const SizedBox(height: AppSpacing.paddingXL * 2),
                
                // Username/ID Field
                _buildFieldLabel('login_username_label'.tr, context),
                const SizedBox(height: AppSpacing.paddingS),
                _buildUsernameField(controller, context, borderFocusColor),
                
                const SizedBox(height: AppSpacing.paddingL),
                
                // Password Field
                _buildFieldLabel('login_password_label'.tr, context),
                const SizedBox(height: AppSpacing.paddingS),
                _buildPasswordField(controller, context, borderFocusColor, primaryColor),
                
                const SizedBox(height: AppSpacing.paddingM),
                
                // Forgot Password Link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // No action needed - just UI
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'login_forgot_password'.tr,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: AppSpacing.paddingXL),
                
                // Login Button
                ElevatedButton(
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: AppColors.textOnPrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.paddingM,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                    ),
                  ),
                  child: Text(
                    'login_title'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                const SizedBox(height: AppSpacing.paddingXL),
                
                // New User Link
                Center(
                  child: TextButton(
                    onPressed: () {
                      // No action needed - just UI
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'login_new_user'.tr,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label, BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildUsernameField(LoginController controller, BuildContext context, Color borderFocusColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;
    final fillColor = isDark ? AppColors.backgroundSecondary : AppColors.backgroundLight;
    final hintColor = isDark ? AppColors.textHintDark : AppColors.textHintLight;
    final iconColor = isDark ? AppColors.textHintDark : AppColors.textHintLight;

    return TextField(
      controller: controller.usernameController,
      textDirection: TextDirection.rtl,
      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
      decoration: InputDecoration(
        hintText: 'login_username_label'.tr,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 14,
        ),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: BorderSide(
            color: borderFocusColor,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingM,
          vertical: AppSpacing.paddingM,
        ),
        prefixIcon: Icon(
          Icons.person_outline,
          color: iconColor,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildPasswordField(LoginController controller, BuildContext context, Color borderFocusColor, Color primaryColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;
    final fillColor = isDark ? AppColors.backgroundSecondary : AppColors.backgroundLight;
    final hintColor = isDark ? AppColors.textHintDark : AppColors.textHintLight;
    final iconColor = isDark ? AppColors.textHintDark : AppColors.textHintLight;

    return Obx(
      () => TextField(
        controller: controller.passwordController,
        obscureText: !controller.isPasswordVisible.value,
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
        decoration: InputDecoration(
          hintText: 'login_password_label'.tr,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: 14,
          ),
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
            borderSide: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
            borderSide: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
            borderSide: BorderSide(
              color: borderFocusColor,
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.paddingM,
            vertical: AppSpacing.paddingM,
          ),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: iconColor,
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: primaryColor,
              size: 20,
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
        ),
      ),
    );
  }
}

