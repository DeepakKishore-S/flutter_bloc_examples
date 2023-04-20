import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_examples/apis/login_api.dart';
import 'package:flutter_bloc_examples/apis/notes_api.dart';
import 'package:flutter_bloc_examples/bloc/actions.dart';
import 'package:flutter_bloc_examples/bloc/app_bloc.dart';
import 'package:flutter_bloc_examples/bloc/app_state.dart';
import 'package:flutter_bloc_examples/dialogs/generic_dialog.dart';
import 'package:flutter_bloc_examples/dialogs/loading_screen.dart';
import 'package:flutter_bloc_examples/model.dart';
import 'package:flutter_bloc_examples/strings.dart';
import 'package:flutter_bloc_examples/views/iterable_list_view.dart';
import 'package:flutter_bloc_examples/views/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(loginApi: LoginApi(), notesApi: NotesApi()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(homepage),
        ),
        body: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            // loading Screen
            if (appState.isLoading) {
              LoadingScreen().show(
                context: context,
                text: pleaseWait,
              );
            } else {
              LoadingScreen().hide();
            }

            //login error
            final loginError = appState.loginError;
            if (loginError != null) {
              showGenericDialog<bool>(
                context: context,
                title: loginErrorDialogTitle,
                content: loginErrorDialogContent,
                optionDialogBuilder: () => {"ok": true},
              );
            }

            // if we have logged in and no fetch notes
            if (appState.isLoading == false &&
                appState.loginError == null &&
                appState.loginHandle == const LoginHandle.foobar() &&
                appState.fetchedNotes == null) {
              context.read<AppBloc>().add(const LoadNotesAction());
            }
          },
          builder: (context, appState) {
            final notes = appState.fetchedNotes;
            if (notes == null) {
              return LoginView(onLoginTapped: (email, password) {
                context.read<AppBloc>().add(LoginAction(
                      email: email,
                      password: password,
                    ),);
              },);
            } else {
              return notes.toListView();
            }
          },
        ),
      ),
    );
  }
}
