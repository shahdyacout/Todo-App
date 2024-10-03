import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/core/my_hive.dart';
import 'package:todo/feature/home/data/models/note_model.dart';

class HomeProvider extends ChangeNotifier{

  List<NoteModel>notes=[];
  convertDate(DateTime date)=> date.toString().split(" ")[0];
  convertTime(TimeOfDay time){
    return "${time.hour}:${time.minute}:${time.period.name}";

  }
  fetchNotesFromHive(){
    notes=Hive.box<NoteModel>(MyHive.notesBox).values.toList();
  }

  addNote({
    required String title,
    required String desc,
    context

  })async
  {

    if(time!= null && startDate!=null && endDate!=null && title.isNotEmpty && desc.isNotEmpty){
      notes.add(
          NoteModel(time:convertTime(time!),
              title: title!,
              description: desc!,
              startDate:convertDate(startDate!),
              endDate: convertDate(endDate!)
          )
      );
       Hive.box<NoteModel>(MyHive.notesBox).add(
           NoteModel(
               time:convertTime(time!),
               title: title!,
               description: desc!,
               startDate:convertDate(startDate!),
               endDate: convertDate(endDate!)
           )
       );

      notifyListeners();
      Navigator.pop(context);

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Please fill data"))
      );
    }
  }

  deleteNote(NoteModel notemodel){
    notes.remove(notemodel);
    notifyListeners();
  }
  updateArchived(int index){
    notes[index].archieveOrNot=!notes[index].archieveOrNot;
    //Hive.box<NoteModel>(MyHive.notesBox).putAt(index, notes[index]);
    notifyListeners();
  }
  updateDone(int index){
    notes[index].doneOrNot=!notes[index].doneOrNot;
    notifyListeners();
    Hive.box<NoteModel>(MyHive.notesBox).putAt(index, notes[index]);

  }
  DateTime ?startDate;
  DateTime ?endDate;
  TimeOfDay ?time ;

selectStartDate(context) async{
  startDate= await showDatePicker(context: context, firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365))
  );
  notifyListeners();
}

selectEndDate(context) async{
  endDate= await showDatePicker(context: context, firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365))
  );
  notifyListeners();
}

selectTime(context) async{
  time=await showTimePicker(context: context, initialTime: TimeOfDay.now());
  notifyListeners();

}



}