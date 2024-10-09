import 'package:daveknows/models/constants.dart';

class UserRegisterItem {
  double? amount;
  double? balance;
  String? createDate;
  String? institutionName;
  String? requestorId;
  String? transferDirection;
  String? transferMethod;
  String? transferStatus;
  String? zelleRequestMethod;

  UserRegisterItem()
      : amount = 0,
        balance = 0,
        createDate = Constants.MISSING,
        institutionName = Constants.MISSING,
        requestorId = Constants.MISSING,
        transferDirection = Constants.MISSING,
        transferMethod = Constants.MISSING,
        transferStatus = Constants.MISSING,
        zelleRequestMethod = Constants.MISSING;

  UserRegisterItem.fromJson(Map<String, dynamic> json, String? token)
      : amount = json['amount']?.toDouble() ?? 0,
        balance = json['balance']?.toDouble() ?? 0,
        createDate = json['create_timestamp'],
        institutionName = json['institution_name'],
        requestorId = json['requester_id'],
        transferDirection = json['transfer_direction'],
        transferMethod = json['transfer_method'],
        transferStatus = json['transfer_status'],
        zelleRequestMethod = json['zelle_request_method'];
}
