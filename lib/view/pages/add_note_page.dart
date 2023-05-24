import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

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
          Padding(
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
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Expanded(
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
            Expanded(
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