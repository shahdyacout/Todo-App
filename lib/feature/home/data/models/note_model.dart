import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final String startDate;
  @HiveField(4)
  final  String endDate;
  @HiveField(5)
  bool  doneOrNot;
  @HiveField(6)
   bool  archieveOrNot;
  NoteModel({
    required this.time,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.archieveOrNot=false,
    this.doneOrNot=false,


});



}
