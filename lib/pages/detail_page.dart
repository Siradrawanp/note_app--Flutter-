import 'package:flutter/material.dart';
import 'package:note_app/pages/note_form_page.dart';
import 'package:note_app/utilities/note_db.dart';

import '../models/note_model.dart';

class DetailArguments {
  final Note note;
  DetailArguments(this.note);
}

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Note currNote;
  @override
  void initState() {
    currNote = Note(
      title: 'title',
      description: 'description',
      time: DateTime.now(),
    );
    super.initState();
  }

  Future refreshNote(Note note) async {
    // currNote = await NoteDatabase.instance.readNote(currNote.id!);
    currNote = note;
    setState(() {});
  }   

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;
    setState(() {
      currNote = args.note;
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.deepOrangeAccent,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return NoteFormPage(
                  note: currNote,
                );
              }));
              refreshNote(args.note);
            },
            child: const Icon(
              Icons.edit_note_rounded,
              color: Colors.deepOrangeAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              left: 16.0,
            ),
            child: InkWell(
              onTap: () async {
                await NoteDatabase.instance.deleteNote(currNote.id!);
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.delete_rounded,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: ListView(
          children: [
            Text(
              currNote.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              currNote.description,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
