import 'package:ddd_notes/application/notes/note_form/note_form_bloc.dart';
import 'package:ddd_notes/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:ddd_notes/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: const Text(
                'Want longer list? Activate premium 😍',
                style: TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                textColor: Colors.white,
                label: 'BUY NOW',
                onPressed: () {},
              ),
            ),
          );
        }
      },
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: formTodos.value.size,
            itemBuilder: (context, index) {
              return TodoTile(index: index);
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends StatelessWidget {
  final int index;

  const TodoTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: todo.done,
      onChanged: (value) {
        context.formTodos = context.formTodos.map((listTodo) =>
            listTodo == todo ? todo.copyWith(done: value!) : listTodo);
        context
            .read<NoteFormBloc>()
            .add(NoteFormEvent.todosChanged(context.formTodos));
      },
      title: Text(todo.name),
    );
  }
}
