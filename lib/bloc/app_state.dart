import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_examples/model.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginError? loginError;
  final LoginHandle? loginHandle;
  final Iterable<Note>? fetchedNotes;

  const AppState.empty()
      : isLoading = false,
        fetchedNotes = null,
        loginError = null,
        loginHandle = null;

  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandle,
    required this.fetchedNotes,
  });

  @override
  String toString() => {
        "isLoading": isLoading,
        "loginError": loginError,
        "loginHandle": loginHandle,
        "fetchedNotes": fetchedNotes,
      }.toString();
}
