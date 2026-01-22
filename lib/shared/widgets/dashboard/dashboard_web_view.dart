import 'package:atria_assignment/core/constants/colors.dart';
import 'package:atria_assignment/core/constants/image_path.dart';
import 'package:atria_assignment/core/utils/app_text_theme.dart';
import 'package:atria_assignment/core/utils/extension/numbers_extension.dart';
import 'package:atria_assignment/core/utils/svg_common_widget.dart';
import 'package:atria_assignment/shared/widgets/dashboard/dashboard_components.dart';
import 'package:atria_assignment/modules/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart' hide SearchBar;

class DashboardWebView extends StatelessWidget {
  final DashboardController dashboardController;

  const DashboardWebView({super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20), child: const DashboardSidebar()),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
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
                const _WebStatsRow(),
                24.height,
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: SingleChildScrollView(child: SurveySection())),
                      const SizedBox(width: 20),
                      Expanded(flex: 2, child: SingleChildScrollView(child: OpportunitiesSection())),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DashboardSidebar extends StatelessWidget {
  const DashboardSidebar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  border: Border.all(color: AppColors.borderColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 30,
                height: 30,
                child: SvgAssetWidget(assetName: SvgPaths.icMenuOpen, size: 10, isPaddingRequired: false),
              ),
              12.width,
              AppTextTheme.textTheme("ATRIAFORCE", fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.primary),
            ],
          ),
          32.height,

          _menuItem(Icons.dashboard, "Dashboard", selected: true),
          _menuItem(Icons.people, "Leads"),
          _menuItem(Icons.radar, "Opportunity"),

          const Spacer(),

          _menuItem(Icons.settings, "Settings"),
          _menuItem(Icons.logout, "Log Out", isLogout: true),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, {bool selected = false, bool isLogout = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary.withAlpha((255 * 0.075).toInt()) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isLogout
                ? AppColors.primary
                : selected
                ? AppColors.primary
                : AppColors.black,
          ),
          12.width,
          AppTextTheme.textTheme(
            title,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected || isLogout ? AppColors.primary : AppColors.black,
          ),
        ],
      ),
    );
  }
}

class _WebStatsRow extends StatelessWidget {
  const _WebStatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(svgPath: SvgPaths.icCalendar, title: "Scheduled Survey", value: "12", isBordered: true),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatCard(svgPath: SvgPaths.icCompletedCalendar, title: "Completed Survey", value: "4", color: Colors.green),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatCard(svgPath: SvgPaths.icTasks, title: "Pending Tasks", value: "26", isPendingTask: true),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatCard(
            svgPath: SvgPaths.icRemovedCalendar,
            title: "Overdue Tasks",
            value: "3",
            color: Colors.red,
            isOverdueTask: true,
          ),
        ),
      ],
    );
  }
}
