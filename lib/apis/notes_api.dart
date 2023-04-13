import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_examples/model.dart';

@immutable
abstract class NotesApiProtocol {
  const NotesApiProtocol();

  Future<Iterable<Note>?> getNotes({required LoginHandle loginHandle});
}

@immutable
class NotesApi extends NotesApiProtocol {
  @override
  Future<Iterable<Note>?> getNotes({required LoginHandle loginHandle}) {
    return Future.delayed(const Duration(seconds: 2),
        () => loginHandle == const LoginHandle.foobar() ? mockNote : null);
  }
}
