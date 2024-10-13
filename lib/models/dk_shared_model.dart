import 'package:framework/shared_model.dart';
import 'package:localstorage_light/main.dart';
import 'package:daveknows/models/backend_settings.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';

class DKSharedModel extends SharedModel {
  DKSharedModel({required super.navigator, super.theme});

  late LocalStorage localStorage;
  bool skipWelcomePage = false;
  String savedEmail = '';

  var backendSettings = BackendSettings();

  void init() async {
    // profile = UserProfile();
    // loginService = AWSService();
    localStorage = await LocalStorage.init(Constants.dkLocalStorage);
    skipWelcomePage = localStorage.getItem(Constants.skipWelcomePage) != false;
  }

  static String? getErrorMessage(dynamic ex) {
    if (ex is Map && ex['error'] != null) {
      return ex['message'] ?? ex['error']?.toString();
    }
    return null;
  }

  static Exception createError(dynamic ex) {
    String? message = getErrorMessage(ex);
    return Exception(message ?? L10nApp.internalError.$);
  }
}
