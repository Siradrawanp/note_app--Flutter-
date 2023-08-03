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
      color: Colors.deepOrangeAccent,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 150,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 8,),
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 4,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                note.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
