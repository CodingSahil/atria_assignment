import 'package:atria_assignment/modules/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(),);
  }

}