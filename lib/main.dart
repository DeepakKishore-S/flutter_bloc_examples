import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_examples/apis/login_api.dart';
import 'package:flutter_bloc_examples/apis/notes_api.dart';
import 'package:flutter_bloc_examples/bloc/app_bloc.dart';
import 'package:flutter_bloc_examples/bloc/app_state.dart';
import 'package:flutter_bloc_examples/dialog/loading_screen.dart';
import 'package:flutter_bloc_examples/strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        body: Center(
          child: BlocConsumer<AppBloc, AppState>(
            listener: (context, state) {
              if(state.isLoading){
                LoadingScreen().
              }
            },
            builder: (context, state) {
              return Container(
                child: const Text('Hello World'),
              );
            },
          ),
        ),
      ),
    );
  }
}
