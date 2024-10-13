import 'package:daveknows/components/dk_aws_service.dart';
import 'package:daveknows/components/navigator.dart';
import 'package:flutter/material.dart';
import 'package:framework/shared_model.dart';
import 'package:localstorage_light/main.dart';
import 'package:daveknows/models/backend_settings.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';

import 'dk_user_profile.dart';

class DKSharedModel extends SharedModel {
  // Private constructor to prevent external instantiation
  DKSharedModel._internal({required super.navigator, required super.theme}) {
    init();
  }

  // Static instance to hold the single instance
  static final DKSharedModel _instance = DKSharedModel._internal(navigator: DKNavigator(), theme: Constants.customTheme);

  // Factory constructor to return the singleton instance
  factory DKSharedModel({required DKNavigator navigator, required ThemeData theme}) {
    return _instance;
  }

  late LocalStorage localStorage;
  bool skipWelcomePage = false;
  String savedEmail = '';

  DKUserProfile _dkUserProfile = DKUserProfile();
  DKUserProfile get dkUserProfile => _dkUserProfile;
  DKAWSService _dkAWSService = DKAWSService();
  DKAWSService get dkAWSService => _dkAWSService!;

  var backendSettings = BackendSettings();

  void init() async {
    _dkUserProfile = DKUserProfile();
    _dkAWSService = DKAWSService();
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
