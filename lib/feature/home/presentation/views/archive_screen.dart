
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Archived Tasks"),
      ),
      body: ListView.builder(itemCount: Provider.of<HomeProvider>(context).notes.length,
        itemBuilder:(context, index) {

        return  ListTile(
        title:Text(Provider.of<HomeProvider>(context).notes[index].title),
        subtitle: Text(Provider.of<HomeProvider>(context).notes[index].time),
        leading: Icon(Icons.broadcast_on_personal),
        trailing: GestureDetector(
        onTap: () {
        setState(() {

        Provider.of<HomeProvider>(context).notes[index].doneOrNot=
        !Provider.of<HomeProvider>(context).notes[index].doneOrNot;

        });
        },
        child: Container(
        padding: EdgeInsets.all(5),
        child: Text("Done"),
        decoration: BoxDecoration(
        color:  Provider.of<HomeProvider>(context).notes[index].doneOrNot ? AppColor.primaryColor :Colors.white,
border: Border.all(color: AppColor.primaryColor),
borderRadius: BorderRadius.circular(10)
),
),
)
,
);
      },

),
    );
  }
}
