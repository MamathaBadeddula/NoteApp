import 'package:flutter/material.dart';

import '../modules/note_odule.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key,required this.onNewNoteCreated});
  final Function (Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final textController=TextEditingController();
  final bodyController=TextEditingController();
  @override
  Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('New Note')),
          ),
          body: Column(
            children: [
              TextFormField(
                controller: textController,
                style: const TextStyle(fontSize: 25),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title'
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: bodyController,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your story'
                ),

              )

            ],
          ),
          floatingActionButton: FloatingActionButton(
          onPressed:() {
            if(textController.text.isEmpty){
              return;
            }
            if (bodyController.text.isEmpty){
              return;
            }
            final note=Note(
              body: bodyController.text,
              title: textController.text,

            );
            widget.onNewNoteCreated(note);
            Navigator.of(context).pop();



      },
            child: const Icon(Icons.save),
      ),

      );
    }
  }

