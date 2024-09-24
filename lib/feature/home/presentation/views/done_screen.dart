
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/feature/home/data/models/note_model.dart';
import 'package:todo/feature/home/presentation/controller/home_controller.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {



  @override
  Widget build(BuildContext context) {
    List<NoteModel> DoneTasks=
    Provider.of<HomeProvider>(context).notes.where((e)=>e.doneOrNot==true).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text("Done Tasks"),
      ),
      body: DoneTasks.isEmpty?
      Center(child: Text("No Done Tasks"))
          :ListView.builder(itemCount: DoneTasks.length,
        itemBuilder:(context, index) {

          return  ListTile(
            title:Text(DoneTasks[index].title),
            subtitle: Text(DoneTasks[index].time),
            leading: Icon(Icons.broadcast_on_personal),

          );
        },

      ),
    );
  }
}
