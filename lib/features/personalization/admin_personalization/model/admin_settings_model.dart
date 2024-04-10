// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AdminSettingsModel {
  final String title;
  final IconData icon;
  final VoidCallback? action;
  AdminSettingsModel({
    required this.title,
    required this.icon,
    this.action,
  });
}
