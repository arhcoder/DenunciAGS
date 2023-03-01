import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuOption {
  String name;
  String route;
  Widget screen;
  IconData icon;
  MenuOption(
      {required this.name,
      required this.route,
      required this.screen,
      required this.icon});
}
