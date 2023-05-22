import 'package:crypto_app/constants/global_context.dart';
import 'package:flutter/material.dart';

class MediaQuerySize {
  static final mediaQuerySize =
      MediaQuery.of(NavigationService.currentContext!).size;
  static final height = mediaQuerySize.height;
  static final width = mediaQuerySize.width;
}
