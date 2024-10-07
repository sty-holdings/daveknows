import 'package:flutter/material.dart';

class USAStates {
  final selectedStateValue = 'AL';

  static Map<String, String> usaStates = {
    'AL': 'Alabama',
    'AK': 'Alaska',
    'AZ': 'Arizona',
    'AR': 'Arkansas',
    'CA': 'California',
    'CO': 'Colorado',
    'CT': 'Connecticut',
    'DE': 'Delaware',
    'FL': 'Florida',
    'GA': 'Georgia',
    'HI': 'Hawaii',
    'ID': 'Idaho',
    'IL': 'Illinois',
    'IN': 'Indiana',
    'IA': 'Iowa',
    'KS': 'Kansas',
    'KY': 'Kentucky',
    'LA': 'Louisiana',
    'ME': 'Maine',
    'MD': 'Maryland',
    'MA': 'Massachusetts',
    'MI': 'Michigan',
    'MN': 'Minnesota',
    'MS': 'Mississippi',
    'MO': 'Missouri',
    'MT': 'Montana',
    'NE': 'Nebraska',
    'NV': 'Nevada',
    'NH': 'New Hampshire',
    'NJ': 'New Jersey',
    'NM': 'New Mexico',
    'NY': 'New York',
    'NC': 'North Carolina',
    'ND': 'North Dakota',
    'OH': 'Ohio',
    'OK': 'Oklahoma',
    'OR': 'Oregon',
    'PA': 'Pennsylvania',
    'RI': 'Rhode Island',
    'SC': 'South Carolina',
    'SD': 'South Dakota',
    'TN': 'Tennessee',
    'TX': 'Texas',
    'UT': 'Utah',
    'VT': 'Vermont',
    'VA': 'Virginia',
    'WA': 'Washington',
    'WV': 'West Virginia',
    'WI': 'Wisconsin',
    'WY': 'Wyoming'
  };

  static String? getStateNameUsingCode(String code) {
    return usaStates[code];
  }

  static String? getStateCode(String stateName) {
    return usaStates.keys.firstWhere((key) => usaStates[key] == stateName);
  }

  static List<String> getAllStateNames() {
    return usaStates.values.toList();
  }

  static List<DropdownMenuItem<String>> getAllStateNamesDropDown() {
    List<DropdownMenuItem<String>> stateNames = [];

    usaStates.forEach((code, name) {
      stateNames.add(DropdownMenuItem(
        value: code,
        child: Text(name),
      ));
    });

    return stateNames;
  }

  static List<String> getAllStateCodes() {
    return usaStates.keys.toList();
  }
}