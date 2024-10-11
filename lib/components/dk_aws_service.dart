import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:daveknows/models/constants.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AWSService {

  Future<String> signUpUser({
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
    required String companyName,
  }) async {
    SignUpResult result;
    try {
      final userAttributes = {
        AuthUserAttributeKey.email: email,
        AuthUserAttributeKey.givenName: firstName,
        AuthUserAttributeKey.familyName: lastName,
        const CognitoUserAttributeKey.custom('company_name'): companyName
      };
      await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      return Constants.STATUS_SUCCESS;
    } on AuthException catch (e) {
      log(e.message);
      return Constants.STATUS_FAILED;
    }
  }

  // Login
  Future<String> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      return Constants.STATUS_SUCCESS;
    } on AuthException catch (e) {
      log(e.message);
      return Constants.STATUS_FAILED;
    }
  }


  // Logout
  Future<void> signOutCurrentUser() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      log('Sign out completed successfully');
    } else if (result is CognitoFailedSignOut) {
      log('Error signing user out: ${result.exception.message}');
    }
  }

  // Future<bool> resetPassword(
  //     String username, String confirmationCode, String newPassword) async {
  //   try {
  //     return await _amplifyAuth.confirmPassword(
  //       username,
  //       confirmationCode,
  //       newPassword,
  //     );
  //   } catch (ex) {
  //     rethrow;
  //   }
  // }

  Future<String> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      // Check if further confirmations are needed or if
      // the sign up is complete.
      return Constants.STATUS_SUCCESS;
    } on AuthException catch (e) {
      log(e.message);
      return Constants.STATUS_FAILED;
    }
  }}
