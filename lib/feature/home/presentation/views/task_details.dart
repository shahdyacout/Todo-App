import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/feature/home/data/models/note_model.dart';
import 'package:todo/feature/home/presentation/controller/home_controller.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key, required this.noteModel});
  final NoteModel noteModel;


  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( widget.noteModel.title),
          Text(widget.noteModel.description ),
          Text(widget.noteModel.startDate),
          Text(widget.noteModel.endDate),
          Text(widget.noteModel.time),
          MaterialButton(
            onPressed: () {
Provider.of<HomeProvider>(context,listen: false).updateArchived(Provider.of<HomeProvider>(context).notes.indexOf(widget.noteModel));
            },
          color: AppColor.primaryColor,
            child: Text(
                Provider.of<HomeProvider>(context).notes[Provider.of<HomeProvider>(context).notes.indexOf(widget.noteModel)].archieveOrNot?"Un Archived":"Archived"),
          ),
          MaterialButton(onPressed: (){

          },
            color: AppColor.primaryColor,
            child: Text("Delete"),
          )
        ],
      ),
    );
  }
}
