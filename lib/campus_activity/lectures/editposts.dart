import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'posts.dart';
class EditNote extends StatefulWidget {
  DocumentSnapshot docid;
  EditNote({required this.docid});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  @override
  void initState(){
    title = TextEditingController(text: widget.docid.get('title'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: (){
              widget.docid.reference.update({'title': title.text
              }).whenComplete(() => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Posts())));
            },
            child: Text(
              "Save",
            ),
          ),
          MaterialButton(
            onPressed: (){
              widget.docid.reference.delete(
              ).whenComplete(() => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Posts())));
            },
            child: Text(
              "Delete",
            ),
          ),

        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'title'
                ),
              ),
            ),),
            SizedBox(height: 10,),
          ],
        ),
      ),

    );
  }
}



