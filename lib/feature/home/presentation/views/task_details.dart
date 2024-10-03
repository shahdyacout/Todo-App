import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/core/app_images.dart';
import 'package:todo/feature/home/data/models/note_model.dart';
import 'package:todo/feature/home/presentation/controller/home_controller.dart';

import '../../../../core/shared_widget/custom_field.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                name:   widget.noteModel.title
              ),
              SizedBox(height: 16,),
              CustomTextField(name: widget.noteModel.description ,
                maxline: 6,minline: 3,
                hinitText:"Enter a Description",),
           const   SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                 color: AppColor.LightPrimaryColor
                ),
          
                  child: ListTile(
                  tileColor: Colors.white,
                  leading: Image.asset(AppImages.calender),
          
                  title: Text("Start Date"),
                  subtitle: Text(
                  widget.noteModel.startDate,
                    style: TextStyle(
                        color: Colors.grey
                    )
                  ),
                ),
              ),
           const   SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: AppColor.LightPrimaryColor,
                ),
          
                  child: ListTile(
                  tileColor: Colors.white,
                  leading: Image.asset(AppImages.calender),
          
                  title: Text("End Date"),
                  subtitle: Text(
                    widget.noteModel.endDate,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
            const  SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
               color: AppColor.LightPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image.asset(AppImages.watch),
          
          
                  title: Text("Add Time"),
                  subtitle:
                  Text(widget.noteModel.time,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
          Provider.of<HomeProvider>(context,listen: false).updateArchived(Provider.of<HomeProvider>(context,listen: false).notes.indexOf(widget.noteModel));
               print("Updated Delete done");
                },
              color: AppColor.primaryColor,
                child: Text(
                    Provider.of<HomeProvider>(context,listen: false).notes[Provider.of<HomeProvider>(context).notes.indexOf(widget.noteModel)].archieveOrNot?"Un Archived":"Archived"),
              ),
              MaterialButton(
                onPressed: (){
          Provider.of<HomeProvider>(context,listen: false).deleteNote(Provider.of<NoteModel>(context));
              },
                color: AppColor.primaryColor,
                child: Text("Delete"),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
