import 'dart:async';
import 'dart:convert';

import 'package:http_auth/http_auth.dart';

abstract class BaseServices {
  final String domain;

  BaseServices({
    required this.domain,
  });

  Future<List?>? getCategories() async => const [];
}
