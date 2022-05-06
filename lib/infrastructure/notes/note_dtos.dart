import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ddd_notes/domain/core/value_objects.dart';
import 'package:ddd_notes/domain/notes/note.dart';
import 'package:ddd_notes/domain/notes/todo_item.dart';
import 'package:ddd_notes/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

@unfreezed
class NoteDTO with _$NoteDTO {
  const NoteDTO._();

  factory NoteDTO({
    @JsonKey(ignore: true) String? id,
    required String body,
    required int color,
    required List<TodoItemDTO> todos,
    @ServerTimestampConverter() required FieldValue serverTimestamp,
  }) = _NoteDTO;

  factory NoteDTO.fromDomain(Note note) {
    return NoteDTO(
      id: note.id.getOrCrash(),
      body: note.body.getOrCrash(),
      color: note.color.getOrCrash().value,
      todos: note.todos.getOrCrash().map(TodoItemDTO.fromDomain).asList(),
      serverTimestamp: FieldValue.serverTimestamp(),
    );
  }

  factory NoteDTO.fromJson(Map<String, dynamic> json) =>
      _$NoteDTOFromJson(json);

  factory NoteDTO.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return NoteDTO.fromJson(doc.data()!).copyWith(id: doc.id);
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id!),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(todos.map((dto) => dto.toDomain()).toImmutableList()),
    );
  }
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue object) {
    return object;
  }
}

@unfreezed
class TodoItemDTO with _$TodoItemDTO {
  const TodoItemDTO._();

  factory TodoItemDTO({
    required String id,
    required String name,
    required bool done,
  }) = _TodoItemDTO;

  factory TodoItemDTO.fromDomain(TodoItem todoItem) {
    return TodoItemDTO(
      id: todoItem.id.getOrCrash(),
      name: todoItem.name.getOrCrash(),
      done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromUniqueString(id),
      name: TodoName(name),
      done: done,
    );
  }

  factory TodoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDTOFromJson(json);
}
