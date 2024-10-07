import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:nats_client/nats/tls.dart';
import 'package:daveknows/models/shared_model.dart';

import 'package:daveknows/index.dart' as index;
import 'package:flutter/material.dart';
import 'package:nats_client/nats/credauth.dart';
import 'package:nats_client/natslite/constants.dart';
import 'package:nats_client/natslite/error.dart';
import 'package:nats_client/natslite/nats.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';

class DKService {
  static Nats? _conn;
  static String? _natsPrefix;
  static final _replaceReqId = RegExp('"requester_id":".*?"');

  static Future<dynamic> httpRequest(String path, Map<String, dynamic> queryParameters, {Object? body, int? timeout}) async {
    final uri = Uri.https(Constants.env.httpHost, path, queryParameters);
    final headers = {
      'Authorization': 'Basic ${json.encode({'date': DateTime.now().toUtc().millisecondsSinceEpoch, 'env': Constants.env.name})}'
    };
    final client = index.dkHttpClient();
    Future<index.Response> request;
    if (body == null) {
      request = client.get(uri, headers: headers);
    } else {
      request = client.post(uri, headers: headers, body: body);
    }
    final response = await request.timeout(
      Duration(seconds: timeout ?? 10),
      onTimeout: () {
        return index.Response('{"error": "${L10nApp.internalError}"}', 408);
      },
    );
    dynamic data;
    try {
      data = utf8.decode(response.bodyBytes);
      data = json.decode(data);
    } catch (ex) {
      log('Decode Error: ${data ?? response.bodyBytes.toString()}');
    }
    if (response.statusCode != 200) {
      throw DKSharedModel.createError(data);
    }
    return data;
  }

  // NATS connection
  static connect(List<String?> params, Function(Status status, dynamic error) statusCallback) async {
    _natsPrefix = params[1];
    _conn = await Nats.connect(opts: {
      'servers': [params[0]],
      'tls': TlsTrustedClient(Constants.env.clientCert, params[3]),
    }, authenticator: CredsAuthenticator(params[2]!), debug: true, statusCallback: statusCallback);
  }

  static Future<String> _request(String command, dynamic body, Map<String, dynamic> opts) async {
    if (body is Map) {
      body = json.encode(body);
    }
    String bodyStr = 'REQUEST::$command: - $body';
    bodyStr = bodyStr.replaceAll(_replaceReqId, '"requester_id": "***"');
    debugPrint(bodyStr, wrapWidth: 1024);
    dynamic data = await _conn!.request('$_natsPrefix.$command', utf8.encode(body), opts);
    if (data is NatsError) {
      throw data;
    }
    final response = utf8.decode(data);
    debugPrint('RESPONSE::$command: $response', wrapWidth: 1024);
    return response;
  }

  static Future<Map<String, dynamic>> requestJSON(String command, dynamic body, [int timeout = 10000]) async {
    String responseJSON = '';
    dynamic response;
    try {
      responseJSON = await _request(command, body, {'timeout': timeout});
    } catch (err) {
      if (err is NatsError && err.error == ErrorCode.TIMEOUT) {
        log('DKService::requestJSON: NATS Response timeout');
        throw Exception(L10nApp.internalError.$);
      }
      if (err.toString() == 'Null check operator used on a null value') {
        responseJSON = await _request(command, body, {'timeout': timeout});
      } else {
        throw Exception('$err');
      }
    } finally {
      response = jsonDecode(responseJSON);
      final error = DKSharedModel.getErrorMessage(response);
      if (error != null) {
        throw Exception(error);
      }
    }
    return Map<String, dynamic>.from(response);
  }

  static Future<Map<String, dynamic>> requestJSONNow(String command, dynamic body, [int timeout = 3000]) async {
    try {
      final responseJSON = await _request(command, body, {'timeout': timeout});
      final response = jsonDecode(responseJSON);
      final message = DKSharedModel.getErrorMessage(response);
      if (message != null) {
        throw Exception(message);
      }
      return Map.from(response);
    } catch (err) {
      if (err is NatsError && err.error == ErrorCode.TIMEOUT) {
        log('DKService::requestJSON: NATS Response timeout');
        throw Exception(L10nApp.internalError.$);
      }
      throw Exception('$err');
    }
  }

  static void close() {
    _conn?.close();
    _conn = null;
  }
}
