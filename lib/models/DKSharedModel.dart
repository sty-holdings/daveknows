import 'dart:ffi';

import 'package:daveknows/components/DKAWService.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/environment.dart';
import 'package:flutter/cupertino.dart';


class DKSharedModel with ChangeNotifier {
  late String _dkState = Constants.STATUS_LOADING;
  late Environment _env;
  late DKAWSService _dkAWSService;

  String get dkState => _dkState;
  Environment get env => _env;
  DKAWSService get dkAWSService => _dkAWSService;

  set dkState(String value) {
    _dkState = value;
    notifyListeners();
  }

  set env(Environment value) {
    _env = value;
    notifyListeners();
  }

  set dkAWSService(DKAWSService value) {
    _dkAWSService = value;
    notifyListeners();
  }
}

class DKSharedModelProvider with ChangeNotifier {
  final DKSharedModel _dkSharedModel = DKSharedModel();

  DKSharedModel get dkSharedModel => _dkSharedModel;

  dynamic initApp(String targetEnv) {
     _loadEnvironmentFile(targetEnv);

  }

  void _loadEnvironmentFile(String targetEnv) async {
    try {
      _dkSharedModel.env = await Environment.getEnv(targetEnv);
    } catch (e) {
      _dkSharedModel.dkState = Constants.STATUS_FAILED;
    }
  }
}