import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/notes/i_note_repository.dart';
import 'package:ddd_notes/infrastructure/notes/note_dtos.dart';
import 'package:kt_dart/kt.dart';
import 'package:ddd_notes/domain/notes/note_failure.dart';
import 'package:ddd_notes/domain/notes/note.dart';
import 'package:ddd_notes/infrastructure/core/firestore_helpers.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    // users/{user ID}/notes/{note ID}
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
            snapshot.docs
                .map((doc) => NoteDTO.fromFirestore(
                        doc as DocumentSnapshot<Map<String, dynamic>>)
                    .toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e, _) {
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.inSufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) => NoteDTO.fromFirestore(
                  doc as DocumentSnapshot<Map<String, dynamic>>)
              .toDomain()),
        )
        .map(
          (notes) => right<NoteFailure, KtList<Note>>(
            notes
                .where((note) =>
                    note.todos.getOrCrash().any((todoItem) => !todoItem.done))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e, _) {
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.inSufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }
}
