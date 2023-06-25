import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_with_firebase/view/utils/dialogs.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String? userId = FirebaseAuth.instance.currentUser?.uid;
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    Color bgColor = const Color(0x00252525);

    // var dialog = Dialogs();

    // showDialog(context: context,
    // builder: (context) => dialog.saveDialog(context,));

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: bgColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 59, 59),
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.arrow_back,
                  size: 24,
                )),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 59, 59),
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.remove_red_eye_outlined,
                  size: 24,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: add,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 59, 59, 59),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.save_sharp,
                    size: 24,
                  )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //* Title

            Expanded(
              flex: 1,
              child: TextField(
                // minLines: 1,
                onChanged: (value) => title = value,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 48,
                    )),
                style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 48),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //* Type Something.....

            Expanded(
              flex: 2,
              child: TextField(
                // minLines: 1,
                onChanged: (value) => content =value,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type something...',
                    hintStyle: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 24,
                    )),
                style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }

  void add() async {
    if (userId != null) {
      DocumentReference parentDocRef =
          FirebaseFirestore.instance.collection("users").doc(userId);

      CollectionReference childCollRef = parentDocRef.collection("notes");

      Map<String, dynamic> data = {
        "title": title,
        "content": content,
        "date": DateTime.now()
      };

      var id = await childCollRef.add(data);

      debugPrint("sussessful $id");
    }
    Navigator.of(context).pop();
  }
}
