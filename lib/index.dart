// ignore_for_file: depend_on_referenced_packages
export 'package:yaml/yaml.dart' show YamlMap, loadYaml;
export 'package:intl/intl.dart' show NumberFormat;
export 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalCupertinoLocalizations, GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
export 'package:http/http.dart';

import 'dart:io';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;

http.Client dkHttpClient() {
  var ioClient = HttpClient();
  //  ..badCertificateCallback = ((X509Certificate cert, String  host, int port) => true);
  return IOClient(ioClient);
}
