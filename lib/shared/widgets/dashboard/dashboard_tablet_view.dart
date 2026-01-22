import 'package:atria_assignment/core/utils/extension/numbers_extension.dart';
import 'package:atria_assignment/modules/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart' hide SearchBar;

import 'dashboard_components.dart';

class DashboardTabletView extends StatelessWidget {
  final DashboardController dashboardController;

  const DashboardTabletView({super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SearchBar()),
                40.width,
                ProfileSectionForWebView(),
              ],
            ),
            20.height,
            HeaderSection(isNotificationRequired: false),
            20.height,
            FilterTabs(controller: dashboardController),
            20.height,
            const StatsGrid(),
            24.height,
            const SurveySection(),
            const OpportunitiesSection(),
          ],
        ),
      ),
    );
  }
}
