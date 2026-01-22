import 'package:atria_assignment/core/constants/colors.dart';
import 'package:atria_assignment/shared/widgets/dashboard/dashboard_components.dart';
import 'package:atria_assignment/shared/widgets/dashboard/dashboard_mobile_view.dart';
import 'package:atria_assignment/shared/widgets/dashboard/dashboard_tablet_view.dart';
import 'package:atria_assignment/shared/widgets/dashboard/dashboard_web_view.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:get/get.dart';
import 'dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late final DashboardController dashboardController;

  @override
  void initState() {
    dashboardController = Get.find<DashboardController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: MediaQuery.widthOf(context) < 960 ? const BottomNavBar() : null,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return DashboardMobile(dashboardController: dashboardController);
            } else if(constraints.maxWidth >= 600 && constraints.maxWidth < 960) {
              return DashboardTabletView(dashboardController: dashboardController);
          } else{
              return DashboardWebView(dashboardController: dashboardController);
            }
          },
        ),
      ),
    );
  }
}
