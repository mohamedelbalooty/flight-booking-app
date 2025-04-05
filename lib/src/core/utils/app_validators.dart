import 'package:easy_localization/easy_localization.dart';

abstract class AppValidators {
  static String? emptyValidator(String? value, {required String label}) {
    if (value == null || value.isEmpty) {
      return '${'empty_validate'.tr()} $label';
    }
    return null;
  }
}
