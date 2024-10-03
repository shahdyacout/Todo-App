import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/shared_widget/custom_field.dart';

import '../app_color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.name,this.hinitText,this.minline=1,this.maxline=3,
  this.controller,this.CustomColor=AppColor.LightPrimaryColor});
  String ?hinitText;
  String name;
  int minline;
  int maxline;
  Color CustomColor;
  TextEditingController ?controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
color: CustomColor,

          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
          style: TextStyle(
            fontWeight: FontWeight.bold
          )
            ,),
          TextFormField(
            onTapOutside: (e){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller:controller,
            minLines: minline,
            maxLines: maxline,
            decoration: InputDecoration(
              hintText: hinitText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              border: InputBorder.none
            ),
          )
        ],
      ),
    );
  }
}
