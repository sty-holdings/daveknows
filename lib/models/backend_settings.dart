import 'package:daveknows/models/constants.dart';

class BackendSettings {
  String authenticatorService;
  String baseURL;
  bool debugMode;
  String environment;
  String hostname;
  String logFQN;
  String messagePrefix;
  String pidDirectory;
  String pidFQN;
  bool secured;
  String startTime;
  String version;
  String webAssetURL;
  String workingDirectory;

  BackendSettings()
      : authenticatorService = Constants.MISSING,
        baseURL = Constants.MISSING,
        debugMode = true,
        environment = Constants.MISSING,
        hostname = Constants.MISSING,
        logFQN = Constants.MISSING,
        messagePrefix = Constants.MISSING,
        pidDirectory = Constants.MISSING,
        pidFQN = Constants.MISSING,
        secured = false,
        startTime = Constants.MISSING,
        version = Constants.MISSING,
        webAssetURL = Constants.MISSING,
        workingDirectory = Constants.MISSING;
}
