import 'package:flutter_bloc_examples/dialog/loading_screen_controller.dart';

class LoadingScreen {
  LoadingScreen._();
  static final LoadingScreen _shared = LoadingScreen._();
  factory LoadingScreen() => _shared;

  LoadingScreenController? controller;
}
