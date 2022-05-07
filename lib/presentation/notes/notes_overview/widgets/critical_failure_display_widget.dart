import 'package:ddd_notes/domain/notes/note_failure.dart';
import 'package:flutter/material.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({Key? key, required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '😱',
            style: TextStyle(fontSize: 100),
          ),
          Text(
            failure.maybeMap(
                inSufficientPermission: (_) => 'Insufficient permission',
                orElse: () => 'Unexpected error.\n Please, contact support'),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.email),
            label: const Text('I NEED HELP'),
          ),
        ],
      ),
    );
  }
}
