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
    return const Placeholder();
  }
}
