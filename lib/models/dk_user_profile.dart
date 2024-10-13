class DKUserProfile {
  DKUserProfile._internal();

  static final DKUserProfile _instance = DKUserProfile._instance;

  factory DKUserProfile() {
    return _instance;
  }

  String _sub = '';
  String _email = ''; //email
  String _firstName = ''; //first_name
  String _lastName = ''; //last_name
  String _companyName = ''; //last_name
  String _country = ''; //user_name

  DKUserProfile.fromJson(Map<String, dynamic> json)
      : _sub = json['sub'],
        _firstName = json['first_name'],
        _lastName = json['last_name'],
        _companyName = json['company_name'],
        _country = json['country'],
        _email = json['email'];

  Map<String, dynamic> toJson() => {
    'sub': _sub,
    'first_name': _firstName,
    'last_name': _lastName,
    'company_name': _companyName,
    'country': _country,
    'email': _email,
  };

  String get sub => _sub;

  set sub(String value) {
    _sub = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get companyName => _companyName;

  set companyName(String value) {
    _companyName = value;
  }

  String get country => _country;

  set country(String value) {
    _country = value;
  }
}