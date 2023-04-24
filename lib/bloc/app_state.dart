import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_examples/model.dart';
import 'package:collection/collection.dart';

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

  @override
  bool operator ==(covariant AppState other) {
    final otherPropertiesAreEqual = other.isLoading == isLoading &&
        other.loginError == loginError &&
        other.loginHandle == loginHandle;

    if (fetchedNotes == null && other.fetchedNotes == null) {
      return true;
    } else {
      return otherPropertiesAreEqual &&
          (fetchedNotes?.isEqualto(other.fetchedNotes) ?? false);
    }
  }
  
  @override
  int get hashCode => Object.hash(isLoading, loginError, loginHandle, fetchedNotes);
  
}

extension UnOrderedEquality on Object {
  bool isEqualto(other) =>
      const DeepCollectionEquality.unordered().equals(this, other);
}
