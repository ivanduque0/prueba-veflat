
import 'package:flutter/cupertino.dart';
import 'package:prueba_veflat/ui/theme.dart';

import 'restRequests.dart';

class Constants {
  RestRequests restRequest = RestRequests();
  static String baseUrl="rickandmortyapi.com";
  static const List<String> genders = [
    "all",
    "male",
    "female",
    "genderless",
    "unknown"
  ];

  static const List<String> sizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL"
  ];

  static const List<Map<String, String>> colors = [
    {"name":"Grey", "value":"ff9e9e9e"},
    {"name":"Black", "value":"ff000000"},
    {"name":"Blue", "value":"ff21b1f3"},
    {"name":"Pink", "value":"ffff79a6"},
    {"name":"Purple", "value":"ffed85ff"},
  ];
}