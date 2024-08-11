import 'package:flutter/cupertino.dart';

class ResponsiveUtil {
  static bool isOnMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 748;

  static bool isOnTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 748 &&
      MediaQuery.of(context).size.width <= 1100;

  static bool isOnDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1100;
}
