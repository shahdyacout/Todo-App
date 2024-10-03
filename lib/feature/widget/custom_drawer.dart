import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/core/app_images.dart';
import 'package:todo/feature/home/presentation/views/archive_screen.dart';
import 'package:todo/feature/home/presentation/views/done_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key,required this.image,required this.name});
 final String name;
 final XFile image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DrawerHeader(
            child: Row(
          children: [
           CircleAvatar(
               backgroundImage: Image.file(
                 height: 48,
                 width: 48,
                 File(image.path),
                 fit: BoxFit.cover,
               ).image
           ),
            Text(name)
          ],
        ),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
          ),
        ),
        const SizedBox(height: 18,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ArchiveScreen();
            },)
            );
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 24),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)
                )
              ),
              tileColor: AppColor.LightPrimaryColor,
              title: Text("Archived Tasks"),
              leading:Image(image: AssetImage(AppImages.ArchivedDrawer)),
            ),
          ),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return DoneScreen();
            },)
            );
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 24),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)
                )
              ),
              tileColor: AppColor.LightPrimaryColor,
              title: Text("Done Tasks"),
              leading:Image(image: AssetImage(AppImages.DoneTask)),

            ),
          ),
        )
      ],
    );
  }
}
