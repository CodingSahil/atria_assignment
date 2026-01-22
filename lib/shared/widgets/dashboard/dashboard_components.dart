import 'package:atria_assignment/core/constants/colors.dart';
import 'package:atria_assignment/core/constants/image_path.dart';
import 'package:atria_assignment/core/utils/app_text_theme.dart';
import 'package:atria_assignment/core/utils/extension/numbers_extension.dart';
import 'package:atria_assignment/core/utils/svg_common_widget.dart';
import 'package:atria_assignment/core/utils/text-field/app_text_field.dart';
import 'package:atria_assignment/modules/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, this.isNotificationRequired = true});

  final bool isNotificationRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppTextTheme.textTheme(
              "Welcome back, Abdeali",
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            4.height,
            buildSubtitle(
              isWeb: !isNotificationRequired,
              widgets: [
                AppTextTheme.textTheme(
                  "Your assigned tasks and site visits for",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  color: AppColors.blackSecondary,
                ),
                if (!isNotificationRequired) 4.width,
                AppTextTheme.textTheme(
                  "${DateFormat("EEE, MMM d").format(DateTime.now())}th",
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  color: AppColors.black,
                ),
              ],
            ),
          ],
        ),
        if (isNotificationRequired) NotificationAndHelpComponent(),
      ],
    );
  }

  Widget buildSubtitle({bool isWeb = false, required List<Widget> widgets}) {
    return isWeb
        ? Row(mainAxisAlignment: MainAxisAlignment.start, children: widgets)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: widgets,
          );
  }
}

class NotificationAndHelpComponent extends StatelessWidget {
  const NotificationAndHelpComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          height: 40,
          width: 40,
          child: Icon(Icons.help_outline, size: 24),
        ),
        12.width,
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
              height: 40,
              width: 40,
              child: Icon(Icons.notifications_none, size: 24),
            ),
            Positioned(
              top: 10,
              right: 12,
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: TextEditingController(),
      prefix: Icon(Icons.search, size: 24, color: AppColors.black.withAlpha((255 * 0.5).toInt())),
      hint: AppTextTheme.textTheme(
        "Search across all records",
        fontSize: 14,
        color: AppColors.black.withAlpha((255 * 0.6).toInt()),
      ),
    );
  }
}

class FilterTabs extends StatelessWidget {
  const FilterTabs({super.key, required this.controller});

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        child: Row(
          children: List.generate(controller.filters.length, (index) {
            final isSelected = controller.selectedFilter.value == controller.filters[index];
            return GestureDetector(
              onTap: () => controller.changeFilter(controller.filters[index]),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isSelected ? AppColors.primary : AppColors.borderColor),
                ),
                child: Center(
                  child: AppTextTheme.textTheme(
                    controller.filters[index],
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: isSelected ? AppColors.primary : AppColors.black,
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        StatCard(svgPath: SvgPaths.icCalendar, title: "Scheduled Survey", value: "12", isBordered: true),
        StatCard(svgPath: SvgPaths.icCompletedCalendar, title: "Completed Survey", value: "4", color: Colors.green),
        StatCard(svgPath: SvgPaths.icTasks, title: "Pending Tasks", value: "26", isPendingTask: true),
        StatCard(
          svgPath: SvgPaths.icRemovedCalendar,
          title: "Overdue Tasks",
          value: "3",
          color: Colors.red,
          isOverdueTask: true,
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String svgPath;
  final String title;
  final String value;
  final Color color;
  final bool isBordered;
  final bool isPendingTask;
  final bool isOverdueTask;

  const StatCard({
    super.key,
    required this.svgPath,
    required this.title,
    required this.value,
    this.color = Colors.black,
    this.isBordered = false,
    this.isPendingTask = false,
    this.isOverdueTask = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isBordered ? AppColors.primary : Colors.transparent, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: (isOverdueTask ? Colors.red : AppColors.borderColor).withAlpha(
                      (255 * (isOverdueTask ? 0.1 : 0.35)).toInt(),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 40,
                  child: SvgAssetWidget(
                    assetName: svgPath,
                    size: 20,
                    svgColor: isOverdueTask ? Colors.red : AppColors.black,
                  ),
                ),
              ),
              if (isPendingTask)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.green.withAlpha((255 * 0.15).toInt()),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppTextTheme.textTheme(
                    "13/39 Done",
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Colors.green,
                  ),
                ),
            ],
          ),
          18.height,
          AppTextTheme.textTheme(value, fontSize: 28, color: color, fontWeight: FontWeight.w700),
          6.height,
          AppTextTheme.textTheme(title, fontSize: 13),
        ],
      ),
    );
  }
}

class SurveySection extends StatelessWidget {
  const SurveySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: "Today's Scheduled Site Survey"),
          12.height,
          ...List.generate(4, (_) => SurveyCard()),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.titleColor, this.isRocketIcon = false});

  final String title;
  final Color? titleColor;
  final bool isRocketIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (isRocketIcon) ...[
              Container(
                decoration: BoxDecoration(color: AppColors.backgroundColor, borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.center,
                width: 40,
                child: SvgAssetWidget(assetName: SvgPaths.icRocket, size: 15, svgColor: AppColors.secondary),
              ),
              8.width,
            ],
            AppTextTheme.textTheme(title, fontSize: 14, color: titleColor ?? AppColors.black, fontWeight: FontWeight.w700),
          ],
        ),
        AppTextTheme.textTheme("See All", fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w500),
      ],
    );
  }
}

class SurveyCard extends StatelessWidget {
  const SurveyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextTheme.textTheme("08:30 AM", fontSize: 16, color: AppColors.black),
              AppTextTheme.textTheme("1.5 hrs", fontSize: 12, color: AppColors.blackSecondary),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextTheme.textTheme("AR-1531172", fontSize: 16, color: AppColors.black),
              AppTextTheme.textTheme("560083", fontSize: 12, color: AppColors.blackSecondary),
            ],
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.backgroundColor, borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            width: 40,
            child: SvgAssetWidget(assetName: SvgPaths.icNavigation, size: 15, svgColor: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.black,
      iconSize: 30,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.radar), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
      ],
    );
  }
}

class OpportunitiesSection extends StatelessWidget {
  const OpportunitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: "Hot Opportunities", titleColor: AppColors.secondary, isRocketIcon: true),
          12.height,
          ...List.generate(4, (index) => OpportunitiesCard(isLast: index == 3)),
        ],
      ),
    );
  }
}

class OpportunitiesCard extends StatelessWidget {
  const OpportunitiesCard({super.key, this.isLast = false});

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 1,
                children: [
                  AppTextTheme.textTheme("AR-1531172", fontSize: 14, fontWeight: FontWeight.w600),
                  AppTextTheme.textTheme("D R Mahesh", color: AppColors.blackSecondary, fontSize: 12),
                  AppTextTheme.textTheme("560083", color: AppColors.blackSecondary, fontSize: 12),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.blue.withAlpha((255 * 0.125).toInt()),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppTextTheme.textTheme("Proposal", fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.blue),
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1),
      ],
    );
  }
}

class ProfileSectionForWebView extends StatelessWidget {
  const ProfileSectionForWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NotificationAndHelpComponent(),
        16.width,
        Container(
          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
          height: 35,
          width: 35,
          alignment: Alignment.center,
          child: AppTextTheme.textTheme("A", fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.white),
        ),
        8.width,
        AppTextTheme.textTheme("Abdeali Ravat", fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.black),
        2.width,
        Icon(Icons.arrow_drop_down_rounded, color: AppColors.black, size: 24),
      ],
    );
  }
}
