import 'package:get/get.dart';
import '../../data/models/dashboard_stats.dart';
import '../../data/models/survey.dart';

class DashboardController extends GetxController {
  final stats = DashboardStats(
    scheduled: 12,
    completed: 4,
    pending: 26,
    overdue: 3,
  ).obs;

  final surveys = <Survey>[
    Survey(
      time: "08:30 AM",
      id: "AR-1531172",
      location: "560083",
      name: "Sanjeet Prakash Rao",
      phone: "9876543201",
    ),
  ].obs;
  final filters = ["Today", "Tomorrow", "This Week", "This Month"];

  final selectedFilter = "Today".obs;

  void changeFilter(String value) {
    selectedFilter.value = value;
  }
}
