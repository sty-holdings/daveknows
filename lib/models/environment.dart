import 'dart:typed_data';

import 'package:daveknows/index.dart';
import 'package:flutter/services.dart' show rootBundle;

class Environment {
  String? name;
  String region;
  String userPoolId;
  String clientId;
  String identityPoolId;
  String httpHost;
  List<String> names;
  ByteData? clientCert;

  static Future<dynamic> getEnv(String env) async {
    final data = await rootBundle.loadString('assets/env/$env.yaml');
    return loadYaml(data);
  }

  Environment.fromJson(this.name, YamlMap yaml)
      : region = yaml['cognito']['region'],
        userPoolId = yaml['cognito']['userPoolId'],
        clientId = yaml['cognito']['clientId'],
        identityPoolId = yaml['cognito']['identityPoolId'],
        httpHost = yaml['httpHost'],
        names = List.from(yaml['ssm']['names']);

  Future<void> loadCertificate(YamlMap yaml) async {
    if (yaml['certFile'] != null) {
      clientCert = await rootBundle.load('assets/env/${yaml['certFile']}');
    }
  }
}
