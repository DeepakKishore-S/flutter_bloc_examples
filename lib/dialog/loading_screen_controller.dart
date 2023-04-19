import 'package:flutter/foundation.dart' show immutable;

typedef CloseLoadinScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadinScreen close;
  final UpdateLoadingScreen update;
  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}
