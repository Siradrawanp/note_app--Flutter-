import 'package:flutter/material.dart';
import 'package:note_app/pages/detail_page.dart';

import '../models/note_model.dart';
import '../utilities/note_db.dart';

class NoteFormPage extends StatefulWidget {
  final Note? note;
  const NoteFormPage({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<NoteFormPage> createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteFormPage> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDesc = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      _controllerTitle.text = widget.note!.title;
      _controllerDesc.text = widget.note!.description;
    }
    super.initState();
  }

  Future updateNote() async {
    final note = widget.note!.copyWith(
      title: _controllerTitle.text,
      description: _controllerDesc.text,
    );

    await NoteDatabase.instance.updateNote(note);
  }

  Future addNote() async {
    final note = Note(
      title: _controllerTitle.text,
      description: _controllerDesc.text,
      time: DateTime.now(),
    );
    await NoteDatabase.instance.createNote(note);
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerDesc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.deepOrangeAccent,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
                onTap: () async {
                  if (widget.note != null) {
                    await updateNote();
                    Navigator.of(context).pop(DetailArguments(widget.note!));
                  } else {
                    await addNote();
                    Navigator.of(context).pop();
                  }
                },
                child: const Icon(
                  Icons.save_rounded,
                  color: Colors.deepOrangeAccent,
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _controllerTitle,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        const BorderSide(color: Colors.deepOrangeAccent),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _controllerDesc,
              maxLines: 16,
              decoration: InputDecoration(
                  hintText: 'Descriptions',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        const BorderSide(color: Colors.deepOrangeAccent),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
