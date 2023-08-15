import 'package:flutter/material.dart';
import 'package:note_app/pages/detail_page.dart';
import '../models/note_model.dart';
import '../utilities/note_db.dart';
import '../widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> listNotes = [];
  bool isLoading = false;

  Future readAllNotes() async {
    setState(() {
      isLoading = true;
    });
    listNotes = await NoteDatabase.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    readAllNotes();
    super.initState();
  }

  @override
  void dispose() {
    NoteDatabase.instance.closeDb();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Note Collection',
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () async {
                        await Navigator.of(context).pushNamed(
                            '/detailPage',
                            arguments: DetailArguments(listNotes[index]),
                          );
                        readAllNotes();
                      },
                      child: CardWidget(
                        note: listNotes[index],
                      ));
                },
                itemCount: listNotes.length,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/noteFormPage');
          readAllNotes();
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
