import 'package:ddd_notes/application/auth/auth_bloc.dart';
import 'package:ddd_notes/application/notes/note_actor/note_actor_bloc.dart';
import 'package:ddd_notes/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:ddd_notes/injection.dart';
import 'package:ddd_notes/presentation/notes/notes_overview/widgets/notes_overview_body_widget.dart';
import 'package:ddd_notes/presentation/notes/notes_overview/widgets/uncompleted_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ddd_notes/presentation/routes/app_router.dart';

class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (e) {
                  context.router.replace(const SignInRoute());
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 5),
                      backgroundColor: Colors.red,
                      content: Text(
                        e.noteFailure.map(
                          unexpected: (_) =>
                              'Unexpected error occured while deleting, please support.',
                          inSufficientPermission: (_) =>
                              'Insufficent permission ❌',
                          unableToUpdate: (_) => 'Impossible Error',
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
              icon: const Icon(Icons.exit_to_app),
            ),
            actions: const [
              UncompletedSwitch(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          body: const SafeArea(
            child: NotesOverviewBody(),
          ),
        ),
      ),
    );
  }
}
