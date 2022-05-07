import 'package:ddd_notes/application/notes/note_form/note_form_bloc.dart';
import 'package:ddd_notes/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:ddd_notes/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:kt_dart/kt.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        context.formTodos = state.note.todos.value.fold(
          (l) => listOf<TodoItemPrimitive>(),
          (todoItemList) => todoItemList.map(
            (_) => TodoItemPrimitive.fromDomain(_),
          ),
        );
      },
      buildWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      builder: (context, state) {
        return ListTile(
          onTap: () {
            context.formTodos =
                context.formTodos.plusElement(TodoItemPrimitive.empty());
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodos));
          },
          enabled: !state.note.todos.isFull,
          contentPadding: const EdgeInsets.all(12),
          leading: const Icon(Icons.add),
          title: const Text("Add Todo"),
        );
      },
    );
  }
}
