
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
    List <NoteModel> notes = context.watch<HomeProvider>().notes;

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
              child:notes.isEmpty?const Center(child: Text("No Notes Please Add Task")):
              ListView.builder(itemBuilder:(c,index)
              {
                return Dismissible(
                  key: GlobalKey(),
                  background: Container(
                    decoration: BoxDecoration(color: Color(0xf46e0a0a),
                    borderRadius: BorderRadius.circular(10)),
                    child:const Icon(Icons.delete_rounded),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(8),
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: LinearGradient(
                        colors: [Color(0xff90B6E2), Color(0xffCDACD3)], // ألوان التدرج
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return TaskDetails(noteModel: notes[index]);
                            }
                        )
                        );
                      },
                     title:Text(notes[index].title),
                      subtitle: Text(notes[index].time),
                      leading: GestureDetector(
                        onTap: (){
                          context.read<HomeProvider>().updateArchived(index);
                        },
                        child: Image.asset(AppImages.ArchivedDrawer),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          Provider.of<HomeProvider>(context,listen: false).updateDone(index);

                          print("opdated done or not done");
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          padding: EdgeInsets.all(5),
                          child: Text("Done",
                          textAlign: TextAlign.center,),
                          decoration: BoxDecoration(
                              color:  notes[index].doneOrNot ? AppColor.primaryColor :Colors.white,
                              border: Border.all(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      )
                      ,
                    ),
                  ),
                );
              },itemCount: notes.length,
              ),
            )


          ],
        ),
      ),
    );
  }
}