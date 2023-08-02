import 'package:flutter/material.dart';

import '../models/note_model.dart';

class CardWidget extends StatelessWidget {
  final Note note;
  const CardWidget({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber.shade300,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 150,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}
