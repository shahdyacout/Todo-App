
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/core/app_images.dart';
import 'package:todo/core/shared_widget/custom_button.dart';
import 'package:todo/core/shared_widget/custom_field.dart';
import 'package:todo/feature/home/data/models/note_model.dart';
import 'package:todo/feature/home/presentation/controller/home_controller.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  @override
  TextEditingController nameController=TextEditingController();
  TextEditingController desController=TextEditingController();
  DateTime dateTimeNow=DateTime.now();


  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(22),
      children: [
        CustomTextField(name: "Task Name",controller:nameController ,),
        SizedBox(height: 16,),
        CustomTextField(name: "Description",maxline: 6,minline: 3,
          hinitText:"Enter a Description",controller:desController ,),
        SizedBox(height: 16,),
        Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Color(0xff90B6E2), Color(0xffCDACD3)], // ألوان التدرج
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),

    child: ListTile(
            tileColor: Colors.white,
            leading: Image.asset(AppImages.calender),
              trailing: GestureDetector(child:
              Image.asset(AppImages.arrowDown),
              onTap: ()async{

              Provider.of<HomeProvider>(context,listen: false).selectStartDate(context);

              },
              ),
            title: Text("Start Date"),
            subtitle: Text(
              Provider.of<HomeProvider>(context).startDate==null?
              "Enter The Start Date":Provider.of<HomeProvider>(context,listen: false)
                .convertDate(Provider.of<HomeProvider>(context).startDate!),
              style: TextStyle(
                color: Colors.grey
              ),
            ),

          ),
        ),
        SizedBox(height: 16,),
        Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Color(0xff90B6E2), Color(0xffCDACD3)], // ألوان التدرج
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),

    child: ListTile(
            tileColor: Colors.white,
            leading: Image.asset(AppImages.calender),
            trailing: GestureDetector(child:
            Image.asset(AppImages.arrowDown),
              onTap: ()async{
          Provider.of<HomeProvider>(context,listen: false).selectEndDate(context);
              },
            ),
            title: Text("End Date"),
            subtitle: Text(
              Provider.of<HomeProvider>(context).endDate==null?
              "Enter The End Date":Provider.of<HomeProvider>(context,listen: false)
          .convertDate(Provider.of<HomeProvider>(context).endDate!),
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
          ),
        ),
        SizedBox(height: 16,),
        Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Color(0xff90B6E2), Color(0xffCDACD3)], // ألوان التدرج
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),

    child: ListTile(
            tileColor: Colors.white,
            leading: Image.asset(AppImages.watch),
            trailing: GestureDetector(child:
            Image.asset(AppImages.arrowDown),
              onTap: ()async{
              Provider.of<HomeProvider>(context,listen: false).selectTime(context);
              },
            ),
            title: Text("Add Time"),
            subtitle: Text(Provider.of<HomeProvider>(context).time==null?
              "Enter Time":Provider.of<HomeProvider>(context,listen: false).convertTime(Provider.of<HomeProvider>(context).time!),
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
          ),
        ),
CustomButton(title: "Add Task", 


    onPressed: (){


    Provider.of<HomeProvider>(context, listen: false).addNote(
        title: nameController.text,
        desc: desController.text,
      context: context,
    );




    }, color:AppColor.primaryColor)

      ],
    );
  }
}
