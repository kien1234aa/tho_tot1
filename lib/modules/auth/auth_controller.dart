import 'package:get/get.dart';
import 'package:tho_tot/modules/auth/auth_state.dart';

class AuthController extends GetxController {
  /// trạng thái đang login hay register
  final Rx<AuthMode> mode = AuthMode.login.obs;

  /// loading chung cho auth
  final RxBool isLoading = false.obs;

  // ===============================
  // INIT
  // ===============================
  @override
  void onInit() {
    super.onInit();

    /// nhận arguments từ StartPage
    final args = Get.arguments;
    if (args is AuthMode) {
      mode.value = args;
    }
  }

  // ===============================
  // CHANGE MODE
  // ===============================
  void switchToLogin() {
    mode.value = AuthMode.login;
  }

  void switchToRegister() {
    mode.value = AuthMode.register;
  }
}
