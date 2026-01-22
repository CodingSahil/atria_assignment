import 'package:atria_assignment/core/constants/colors.dart';
import 'package:atria_assignment/core/routes/routes.dart';
import 'package:atria_assignment/core/utils/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if (mounted) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.toNamed(Routes.home);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: AppTextTheme.textTheme(
          "Welcome to Assignment for Atria Power",
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: AppColors.black,
        ),
      ),
    );
  }
}
