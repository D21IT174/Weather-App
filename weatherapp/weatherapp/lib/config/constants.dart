import 'package:flutter/material.dart';

class constant extends StatefulWidget {
  const constant({Key? key}) : super(key: key);

  @override
  State<constant> createState() => _constantState();
}

class ApiConstants {
  static String baseUrl = 'http://dataservice.accuweather.com';
  static String usersEndpoint = '/users';
}

class _constantState extends State<constant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
