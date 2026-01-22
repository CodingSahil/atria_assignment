import 'package:atria_assignment/core/utils/extension/numbers_extension.dart';
import 'package:atria_assignment/modules/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'dashboard_components.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key, required this.dashboardController});

  final DashboardController dashboardController;

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        HeaderSection(),
        18.height,
        SearchBar(),
        15.height,
        FilterTabs(controller: widget.dashboardController),
        18.height,
        StatsGrid(),
        15.height,
        SurveySection(),
        15.height,
        OpportunitiesSection(),
        8.height,
      ],
    );
  }
}
