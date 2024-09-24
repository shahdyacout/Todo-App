import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/core/app_images.dart';
import 'package:todo/feature/add_note/presentation/views/add_note_screen.dart';
import 'package:todo/feature/home/data/models/note_model.dart';
import 'package:todo/feature/home/presentation/controller/home_controller.dart';
import 'package:todo/feature/home/presentation/views/task_details.dart';
import 'package:todo/feature/widget/appar_widget.dart';
import 'package:todo/feature/widget/custom_drawer.dart';

class HomeScreen extends StatefulWidget{
  @override
  const HomeScreen( {  required  this.name,required this.photo});
  final String name;
  final XFile photo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    List<NoteModel> UnArchiveNotes =Provider.of<HomeProvider>(context).notes.where((e) =>e.archieveOrNot==false).toList();
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.white,
            onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder:(c){
    return AddNoteScreen();
  }
  )
  );

            },
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
          child: CustomDrawer(image:widget.photo , name: widget.name)
        ),
        body: Column(
          children: [
            CustomAppbar(name: widget.name, photo: widget.photo),
            Expanded(
              child:UnArchiveNotes.isEmpty?Center(child: Text("No Notes Please Add Task")):
              ListView.builder(itemBuilder:(c,index)
              {
                return Dismissible(
                  key: GlobalKey(),
                  background: Container(
                    decoration: BoxDecoration(color: Color(0xf46e0a0a),
                    borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.delete_rounded),
                  ),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return TaskDetails(noteModel: UnArchiveNotes[index]);
                          }
                      )
                      );
                    },
                   title:Text(UnArchiveNotes[index].title),
                    subtitle: Text(UnArchiveNotes[index].time),
                    leading: Icon(Icons.broadcast_on_personal),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {

                          UnArchiveNotes[index].doneOrNot=!UnArchiveNotes[index].doneOrNot;

                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text("Done"),
                        decoration: BoxDecoration(
                            color:  UnArchiveNotes[index].doneOrNot ? AppColor.primaryColor :Colors.white,
                            border: Border.all(color: AppColor.primaryColor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    )
                    ,
                  ),
                );
              },itemCount: UnArchiveNotes.length,
              ),
            )


          ],
        ),
      ),
    );
  }
}