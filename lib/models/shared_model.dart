import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:framework/shared_model.dart';
import 'package:localstorage_light/main.dart';
import 'package:daveknows/components/login_service.dart';
import 'package:daveknows/models/backend_settings.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/models/user_profile.dart';

import 'http_settings.dart';
import 'todo_item.dart';

class DKSharedModel extends SharedModel {
  DKSharedModel({required super.navigator, super.theme});

  late LocalStorage localStorage;
  late AWSService loginService;
  late UserProfile profile;
  late bool displaySideNav = true;
  bool skipWelcomePage = false;
  String savedUserName = '';
  String selectedState = '';

  var toDoList = <ToDoItem>[];
  Map<String, ToDoItem> toDos = {};

  var backendSettings = BackendSettings();
  var httpSettings = HTTPSettings();

  void init() async {
    profile = UserProfile();
    loginService = AWSService();
    localStorage = await LocalStorage.init(Constants.dkLocalStorage);
    skipWelcomePage = localStorage.getItem(Constants.skipWelcomePage) != false;
  }

  String getError(dynamic ex) {
    if (ex is CognitoClientException || ex is Exception) {
      return ex.message ?? ex.toString();
    } else {
      return createError(ex).toString();
    }
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
