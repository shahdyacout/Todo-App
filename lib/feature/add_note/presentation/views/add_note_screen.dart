import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/app_images.dart';
import 'package:todo/feature/add_note/presentation/views/add_note_body.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Task"),
        leading:Image.asset(AppImages.arrowBackBlack),
      ),
      body: AddNoteBody(),
    );
  }
}
