import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/core/failures.dart';
import 'package:ddd_notes/domain/core/value_objects.dart';
import 'package:ddd_notes/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem {
  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  const TodoItem._();

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold(
      (l) => some(l),
      (_) => none(),
    );
  }
}
