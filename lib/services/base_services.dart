import 'dart:async';

abstract class BaseServices {
  final String domain;

  BaseServices({
    required this.domain,
  });

  //Solmar-env.eba-vxgpfxub.us-east-1.elasticbeanstalk.com/api/v1/eth/collection/trending_1_month
  Future<List?>? getTrending1Month() async => const [];
}
