import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:daveknows/models/constants.dart';

class LoginService {
  late CognitoUser? _cognitoUser;

  final CognitoUserPool _userPool = CognitoUserPool(
    Constants.env.userPoolId,
    Constants.env.clientId,
  );

  Future<CognitoUserPoolData?> createUser(
      String username,
      String password,
      String firstName,
      String lastName,
      String companyName,
      String email) async {
      // String areaCode,
      // String phoneNumber,
      // String country) async {
    try {
      return (await _userPool.signUp(
        username,
        password,
        userAttributes: [
          AttributeArg(name: 'given_name', value: firstName),
          AttributeArg(name: 'family_name', value: lastName),
          AttributeArg(name: 'custom:company_name', value: companyName),
          AttributeArg(name: 'email', value: email),
          // AttributeArg(name: 'custom:areaCode', value: areaCode),
          // AttributeArg(name: 'custom:phoneNumber', value: phoneNumber),
        ],
      ));
    } catch (ex) {
      rethrow;
    }
  }

  // Login
  Future<CognitoUserSession?> login(String username, String password) async {
    _cognitoUser = CognitoUser(username, _userPool);
    try {
      return await _cognitoUser!.authenticateUser(AuthenticationDetails(
        username: username,
        password: password,
      ));
    } catch (ex) {
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    if (_cognitoUser != null) {
      _cognitoUser!.signOut();
    }
    _cognitoUser = null;
  }

  Future<bool> resetPassword(
      String username, String confirmationCode, String newPassword) async {
    _cognitoUser = CognitoUser(username, _userPool);
    return _cognitoUser!.confirmPassword(confirmationCode, newPassword);
  }
}
