import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/core/app_images.dart';
import 'package:todo/feature/login/presentation/controller/theme_controller_provider.dart';
import 'package:todo/feature/login/presentation/views/login_screen.dart';

//bool switchValue=false;
class onboardingBody extends StatefulWidget{
  @override
  State<onboardingBody> createState() => _onboardingBodyState();
}

class _onboardingBodyState extends State<onboardingBody> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
Switch(value: Provider.of<ThemeProvider>(context).switchvalue,
    onChanged: (b){
      Provider.of<ThemeProvider>(context,listen: false).ChangeSwitchValue(b);



    }
),
Image.asset(AppImages.Onboarding),
          SizedBox(height: 61,),
          Text(
            '''  ToDo List  
Daily Task''',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height:21),
          Text(
            '''This productive tool is designed to help
          you better manage your task
              project-wise conveniently!''',
            style: Theme.of(context).textTheme.bodyMedium
      ),
          SizedBox(height: 50,),
          MaterialButton(
            color: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
            onPressed: (){
Navigator.pushReplacement(context,
    MaterialPageRoute(
      builder: (context) {
      return LoginScreen();
    },
    )
);
          },
            child: Row(
              children: [
                Expanded(
                  child: Text("Let's Start",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Image.asset(AppImages.arrowBack)
              ],
            ),

          )
        ],
      ),
    );
  }
}
