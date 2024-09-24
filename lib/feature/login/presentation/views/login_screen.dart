import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/core/app_images.dart';
import 'package:todo/feature/home/presentation/views/home_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ImagePicker picker = ImagePicker();
              XFile? image;
              TextEditingController username=TextEditingController();

  PickPhoto(ImageSource imagesource) async {
     image= await picker.pickImage(source: imagesource
    ) ;
     setState(() {
       
     });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
Image.asset(AppImages.ImageLogin),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(context: context,
                      builder:  (context) {
                        return Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                           children: [
                             GestureDetector(
                              onTap: (){
                                PickPhoto(ImageSource.gallery)   ;
                              },
                               child: Container(
                                 child: Expanded(
                                   child: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       Icon(Icons.photo_size_select_actual_outlined) ,
                                       Text("Gallary"),
                                     ],
                                   ),
                                 ),
                               ),
                             ) ,
                             GestureDetector(
                               onTap: (){
                                 PickPhoto(ImageSource.camera) ;
                               },
                               child: Container(
                                 child: Expanded(
                                   child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                     children: [
                                       Icon(Icons.add_a_photo)  ,
                                       Text("Camera"),
                                     ],
                                   ),
                                 ),
                               ),
                             )

                           ],
                          ),
                        ) ;
                      },
                  )   ;
                },
                child: Container(
                  width: 120,
                  height: 120,
                child: image==null? Icon(
                     Icons.add_a_photo,
                      size: 40,
                     color: AppColor.primaryColor,
                             ):
                     ClipRRect(
                       borderRadius: BorderRadius.circular(20),

                       child: Image.file(File(image!.path),fit: BoxFit.cover,),
                     ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Text(Image==null ?"Add Photo":"updata photo"),

              SizedBox(height: 37,),
               Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(15),
                   border:Border.all(color: AppColor.primaryColor),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(top: 16,left: 16),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Your Name",
                       ),
                       TextFormField(
                         controller: username,
                         decoration: InputDecoration(
                           border:InputBorder.none,
                           hintText: "Enter Your Name  ",
                         ),
                       ),

                     ],
                   ),
                 ),
               ) ,
              SizedBox(height: 47,),
              Material(
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  onPressed: (){
                    if (image==null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error you must select photo"))
                      );
                    }
                    else
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return HomeScreen(name: username.text,photo:image!);
                            },)
                        );
                      }
                  },
                  color: AppColor.primaryColor,
                  height: 52,
                  minWidth: 330,
                  padding: EdgeInsets.symmetric(vertical: 14,horizontal: 100),
                  child: Text("Get Started",
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,)
                    ,),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}