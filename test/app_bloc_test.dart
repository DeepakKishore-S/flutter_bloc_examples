import 'dart:math';

import 'package:flutter_bloc_examples/apis/login_api.dart';
import 'package:flutter_bloc_examples/apis/notes_api.dart';
import 'package:flutter_bloc_examples/bloc/app_bloc.dart';
import 'package:flutter_bloc_examples/bloc/app_state.dart';
import 'package:flutter_bloc_examples/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart' show immutable;

const Iterable<Note> mockNotes = [
  Note(title: "Note 1"),
  Note(title: "Note 2"),
  Note(title: "Note 3")
];

@immutable
class DummyNotesApi implements NotesApiProtocol {
  final LoginHandle acceptedLoginHandle;
  final Iterable<Note>? notesToReturnforAcceptedLoginHandle;

  const DummyNotesApi(
      {required this.acceptedLoginHandle,
      required this.notesToReturnforAcceptedLoginHandle});

  const DummyNotesApi.empty()
      : acceptedLoginHandle = const LoginHandle.foobar(),
        notesToReturnforAcceptedLoginHandle = null;

  @override
  Future<Iterable<Note>?> getNotes({required LoginHandle loginHandle}) async {
    if (loginHandle == acceptedLoginHandle) {
      return notesToReturnforAcceptedLoginHandle;
    } else {
      return null;
    }
  }
}

@immutable
class DummyLoginApi implements LoginApiProtocol {
  final String acceptedEmail;
  final String acceptedPassword;

  const DummyLoginApi({
    required this.acceptedEmail,
    required this.acceptedPassword,
  });

  const DummyLoginApi.empty()
      : acceptedEmail = "",
        acceptedPassword = "";

  @override
  Future<LoginHandle?> login({
    required String email,
    required String password,
  }) async {
    if (email == acceptedEmail && password == acceptedPassword) {
      return const LoginHandle.foobar();
    } else {
      return null;
    }
  }
}

void main() {
  blocTest<AppBloc, AppState>(
    "App Bloc Testing intial state should be empty",
    build: () => AppBloc(
      loginApi: const DummyLoginApi.empty(),
      notesApi: const DummyNotesApi.empty(),
    ),
    verify: (appbloc) => expect(appbloc.state, const AppState.empty()),
  );

  blocTest<AppBloc, AppState>(
    "App Bloc Testing passing the correct login credentials",
    build: () => AppBloc(
      loginApi: const DummyLoginApi(
        acceptedEmail: "sdk@gmail.com",
        acceptedPassword: "123",
      ),
      notesApi: const DummyNotesApi.empty(),
    ),
    
  );
}
