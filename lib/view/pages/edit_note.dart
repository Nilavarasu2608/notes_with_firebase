import 'package:flutter/material.dart';
import 'package:notes_with_firebase/view/utils/save_dialog.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});

  void saveDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return const SaveDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = const Color(0x00252525);
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
        
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          backgroundColor: const Color.fromARGB(255, 59, 59, 59),
          elevation: 10,
          child: const Icon(
            Icons.save_rounded,
            size: 38,
          ),
        ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            
            //* Title

            Expanded(
              flex: 1,
              child: TextField(
                // minLines: 1,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 48,
                    )),
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 48),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //* Type Something.....

            Expanded(
              flex: 2,
              child: TextField(
                // minLines: 1,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type something...',
                    hintStyle: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 24,
                    )),
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}