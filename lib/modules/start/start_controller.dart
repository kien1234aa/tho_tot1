import 'package:get/get.dart';
import 'package:tho_tot/routes/app_routes.dart';

class StartController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _handleStart();
  }

  Future<void> _handleStart() async {
    await Future.delayed(const Duration(seconds: 2));

    final bool isLoggedIn = true;

    if (isLoggedIn) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
