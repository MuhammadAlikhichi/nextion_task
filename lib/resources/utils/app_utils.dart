import 'package:get/get.dart';

class AppUtils {
  static void showSnackBar({required String title, required String message}) {
    Get.snackbar(title, message);
  }
}
