import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

class Environment {
  String? name;
  late AmplifyOutput amplifyOutput;
  List<String> ssmNames;

  static Future<Environment> getEnv(String targetEnv) async {
    final data = await rootBundle.loadString('assets/env/$targetEnv.yaml');
    final yaml = loadYaml(data);
    return Environment.fromJson(targetEnv, yaml);
  }

  Environment.fromJson(this.name, YamlMap yaml)
      : amplifyOutput = AmplifyOutput.fromJson(yaml['amplify-output']),
        ssmNames = List<String>.from(yaml['ssm_names']);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amplify-output': amplifyOutput.toJson(),
      'ssm_names': ssmNames,
    };
  }
}

class AmplifyOutput {
  late Auth auth;
  String version;

  AmplifyOutput.fromJson(YamlMap yaml)
      : auth = Auth.fromJson(yaml['auth']),
        version = yaml['version'];

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'auth': auth.toJson(),
    };
  }
}


class Auth {
  String userPoolId;
  String awsRegion;
  String userPoolClientId;
  String identityPoolId;
  List<dynamic> mfaMethods;
  List<String> standardRequiredAttributes;
  List<String> usernameAttributes;
  List<String> userVerificationTypes;
  String mfaConfiguration;
  PasswordPolicy passwordPolicy;
  bool unauthenticatedIdentitiesEnabled;

  Auth.fromJson(YamlMap yaml)
      : userPoolId = yaml['user_pool_id'],
        awsRegion = yaml['aws_region'],
        userPoolClientId = yaml['user_pool_client_id'],
        identityPoolId = yaml['identity_pool_id'],
        mfaMethods = yaml['mfa_methods'],
        standardRequiredAttributes =
            List<String>.from(yaml['standard_required_attributes']),
        usernameAttributes = List<String>.from(yaml['username_attributes']),
        userVerificationTypes =
            List<String>.from(yaml['user_verification_types']),
        mfaConfiguration = yaml['mfa_configuration'],
        passwordPolicy = PasswordPolicy.fromJson(yaml['password_policy']),
        unauthenticatedIdentitiesEnabled =
            yaml['unauthenticated_identities_enabled'];

  Map<String, dynamic> toJson() {
    return {
      'user_pool_id': userPoolId,
      'aws_region': awsRegion,
      'user_pool_client_id': userPoolClientId,
      'identity_pool_id': identityPoolId,
      'mfa_methods': mfaMethods,
      'standard_required_attributes': standardRequiredAttributes,
      'username_attributes': usernameAttributes,
      'user_verification_types': userVerificationTypes,
      'mfa_configuration': mfaConfiguration,
      'password_policy': passwordPolicy.toJson(),
      'unauthenticated_identities_enabled': unauthenticatedIdentitiesEnabled,
    };
  }
}

class PasswordPolicy {
  int minLength;
  bool requireLowercase;
  bool requireNumbers;
  bool requireSymbols;
  bool requireUppercase;

  PasswordPolicy.fromJson(YamlMap yaml)
      : minLength = yaml['min_length'],
        requireLowercase = yaml['require_lowercase'],
        requireNumbers = yaml['require_numbers'],
        requireSymbols = yaml['require_symbols'],
        requireUppercase = yaml['require_uppercase'];

  Map<String, dynamic> toJson() {
    return {
      'min_length': minLength,
      'require_lowercase': requireLowercase,
      'require_numbers': requireNumbers,
      'require_symbols': requireSymbols,
      'require_uppercase': requireUppercase,
    };
  }
}
