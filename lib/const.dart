import 'package:flutter/material.dart';

extension doubleExt on double {
  double ofHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * this;

  double ofWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * this;
}