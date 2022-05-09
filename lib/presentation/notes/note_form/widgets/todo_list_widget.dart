import 'package:ddd_notes/application/notes/note_form/note_form_bloc.dart';
import 'package:ddd_notes/domain/notes/value_objects.dart';
import 'package:ddd_notes/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:ddd_notes/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

class TodoTile extends HookWidget {
  final int index;

  const TodoTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());
    final controller = useTextEditingController(text: todo.name);
    return Slidable(
      key: ValueKey(todo.id.getOrCrash()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.formTodos = context.formTodos.minusElement(todo);
              context
                  .read<NoteFormBloc>()
                  .add(NoteFormEvent.todosChanged(context.formTodos));
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 2.0,
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: todo.done,
          onChanged: (value) {
            context.formTodos = context.formTodos.map((listTodo) =>
                listTodo == todo ? todo.copyWith(done: value!) : listTodo);
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodos));
          },
          title: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Todo',
              counterText: '',
              border: InputBorder.none,
            ),
            maxLength: TodoName.maxLength,
            onChanged: (value) {
              context.formTodos = context.formTodos.map((listTodo) =>
                  listTodo == todo ? todo.copyWith(name: value) : listTodo);
              context
                  .read<NoteFormBloc>()
                  .add(NoteFormEvent.todosChanged(context.formTodos));
            },
            validator: (_) =>
                context.read<NoteFormBloc>().state.note.todos.value.fold(
                      (either) => either.maybeMap(
                        orElse: () => '',
                      ),
                      (todoList) => todoList[index].name.value.fold(
                            (l) => l.maybeMap(
                              empty: (_) => 'Cannot be empty',
                              exceedingLength: (_) => 'Too long',
                              multiline: (_) => 'Has to be in a single line',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                    ),
          ),
        ),
      ),
    );
  }
}
