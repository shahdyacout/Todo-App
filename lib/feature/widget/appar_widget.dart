import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/core/app_images.dart';

class CustomAppbar extends StatelessWidget{
  CustomAppbar({  required  this.name,required this.photo});

  final XFile photo;
 final String name;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor
      ),
      child: Row(
        children: [
          GestureDetector(child: Image.asset(AppImages.menu),
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
          ),
          Expanded(
            child: Column(
              children: [
                Text("Hello",
                  style: TextStyle(
                      fontFamily:"LexendDeca-Regular.ttf",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF306BA6)
                  )
                  ,),
                Text(name,
                  style: TextStyle(
                      fontFamily:"LexendDeca-Regular.ttf",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF306BA6)
                  )
                  ,),
                Text(DateTime.now().toString().split(" ")[0]),

              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 34,
            child: CircleAvatar(
              radius:  30 ,
              backgroundImage: Image.file(
                File(photo.path),
                fit: BoxFit.cover,
              ).image,
            ),
          )

        ],
      ),
    );
  }

}