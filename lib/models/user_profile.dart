import 'package:flutter/material.dart';
import 'package:daveknows/models/constants.dart';

class UserProfile {
  String? id;
  String? areaCode; //area_code
  String? city; //city
  String? email; //email
  String? firstName; //first_name
  String? lastName; //last_name
  String? companyName; //last_name
  String? password; //phone_line - NEVER SAVE THIS PROPERTY
  String? phoneLine; //phone_line
  String? state; //state
  String? streetAddress; //street_address
  String? userName; //user_name
  String? country; //user_name

  String? toDoRefId; //to_do_ref_id
  String? zipCode; //zip_code

  Widget? avatar;

  UserProfile()
      : toDoRefId = Constants.EMPTY {
    genAvatar();
  }

  UserProfile.fromJson(Map<String, dynamic> json, String? token)
      : id = token,
        firstName = json['first_name'],
        lastName = json['last_name'],
        companyName = json['company_name'],
        streetAddress = json['street_address'],
        city = json['city'],
        state = json['state'],
        zipCode = json['zip_code'],
        country = json['country'],
        areaCode = json['area_code'],
        phoneLine = json['phone_number'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'requester_id': id,
        'first_name': firstName,
        'last_name': lastName,
        'company_name': companyName,
        'street_address': streetAddress,
        'city': city,
        'state': state,
        'zip_code': zipCode,
        'country': country,
        'area_code': areaCode,
        'phone_number': phoneLine,
        'email': email,
        'to_do_ref_id': toDoRefId
      };

  void genAvatar() {
    if (firstName == null || lastName == null) {
      avatar = Constants.defaultAvatar;
    } else {
      avatar = Text('${firstName?.substring(0, 1)}${lastName?.substring(0, 1)}',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
    }
  }
}
