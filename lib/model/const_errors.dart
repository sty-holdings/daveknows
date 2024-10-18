// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'environment.dart';

class ConstErrors {

  // App - This is returned to the user
  static const ERR_INITIALIZING_AUTH = 'Error initializing auth:';
  static const ERR_USER_NOT_CONFIRMED =
      'DaveKnows has sent you an email to confirm your account. \nPlease click on the link in the email or click on "Need Help" and "Resend Confirmation".';
  static const ERR_USER_ALREADY_EXISTS =
      'This email already exists. You can reset your password or contact the helpdesk at helpdesk@daveknows.ai.';
  static const ERR_USER_INVALID_CONFIRMATION_CODE =
      'The code you enter is invalid. Please try again.';

  // AWS - Is an error returned from AWS
  static const AWS_ERR_USER_NOT_CONFIRMED = 'UserNotConfirmedException';
  static const AWS_ERR_USERNAME_EXISTS = 'UsernameExistsException';

  // Server - is an error returned from the DaveKnows Server or the DaveKnows Http service
  static const DK_ERR_INFORMATION_NOT_FOUND = 'The needed information was not found.';
  static const DK_ERR_REQUESTER_ID_MISSING =
      '[ERROR] The requester id is missing.';
}
