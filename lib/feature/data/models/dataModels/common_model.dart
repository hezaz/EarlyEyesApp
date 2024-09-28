import 'dart:ui';

import 'package:flutter/material.dart';

class CommonModel {
  String? title;
  String? subtitle;
  String? description;
  String? image;
  VoidCallback? onTap;
  Widget? child;
  bool isSelected;

  CommonModel(
      {this.title,
      this.image,
      this.subtitle,
      this.description,
      this.onTap,
      this.child,
      this.isSelected = false});
}
