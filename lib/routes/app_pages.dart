import 'package:get/get_navigation/get_navigation.dart';
import 'package:tho_tot/modules/auth/auth_binding.dart';
import 'package:tho_tot/modules/auth/auth_page.dart';
import 'package:tho_tot/modules/start/start_page.dart';
import 'package:tho_tot/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.START, page: () => StartPage()),
    GetPage(name: Routes.AUTH, page: () => AuthPage(), binding: AuthBinding()),
  ];
}
