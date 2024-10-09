class Country {
  static Map<String, String> countries = {
    'US': 'United States',
    'CA': 'Canada',
  };

  static String getCountryCode(String countryName) {
    return countries.keys.firstWhere((key) => countries[key] == countryName);
  }

  static String? getCountryName(String countryCode) {
    return countries[countryCode];
  }
}