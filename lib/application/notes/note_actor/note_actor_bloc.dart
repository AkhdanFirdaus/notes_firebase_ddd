import 'package:bloc/bloc.dart';
import 'package:ddd_notes/domain/notes/i_note_repository.dart';
import 'package:ddd_notes/domain/notes/note.dart';
import 'package:ddd_notes/domain/notes/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';
part 'note_actor_bloc.freezed.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository) : super(const NoteActorState.initial()) {
    on<NoteActorEvent>((event, emit) async {
      await event.map(
        deleted: (e) async {
          emit(const NoteActorState.actionInProgress());
          final possibleFailure = await _noteRepository.delete(e.note);
          emit(possibleFailure.fold(
            (l) => NoteActorState.deleteFailure(l),
            (r) => const NoteActorState.deleteSuccess(),
          ));
        },
      );
    });
  }
}
