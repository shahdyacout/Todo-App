
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/core/app_images.dart';
import 'package:todo/feature/home/data/models/note_model.dart';
import 'package:todo/feature/home/presentation/controller/home_controller.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    List<NoteModel>  ArchivedTasks=
    Provider.of<HomeProvider>(context).notes.where((e)=>e.archieveOrNot==true).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Archived Tasks"),
      ),
      body: Expanded(
        child: ListView.builder(itemCount: ArchivedTasks.length,
          itemBuilder:(context, index) {
        
          return
            ListTile(
              
            title:Text(ArchivedTasks[index].title),
            subtitle: Text(ArchivedTasks[index].time),
            leading:InkWell(
              onTap: (){
                Provider.of<HomeProvider>(context,listen: false).updateArchived(index);
              },
            
                child: Image.asset(AppImages.ArchivedDrawer),
            ),
            trailing: InkWell(
            onTap: () {
            
            Provider.of<HomeProvider>(context).updateDone(index);
            
            },
            child: Container(
            padding: EdgeInsets.all(5),
            child: Text("Done"),
            decoration: BoxDecoration(
            color:  ArchivedTasks[index].doneOrNot ? AppColor.primaryColor :Colors.white,
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(10)
            ),
            ),
            )
            ,
            );
        },
        
        ),
      ),
    );
  }
}
