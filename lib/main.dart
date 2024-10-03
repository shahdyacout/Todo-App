import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_theme.dart';
import 'package:todo/core/my_hive.dart';
import 'package:todo/feature/home/data/models/note_model.dart';
import 'package:todo/feature/home/presentation/controller/home_controller.dart';
import 'package:todo/feature/login/presentation/controller/theme_controller_provider.dart';
import 'package:todo/feature/on_boarding/presentation/views/onboarding_screen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox(MyHive.settingsBox);
  await Hive.openBox<NoteModel>(MyHive.notesBox);
  runApp(  MultiProvider(providers: [
    ChangeNotifierProvider(create: (c)=>ThemeProvider()),
    ChangeNotifierProvider(create: (c)=>HomeProvider())
  ],
      child: Todo()));
}
class Todo extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false).setswitchValueFromHive();
    Provider.of<HomeProvider>(context,listen: false).fetchNotesFromHive();
    // TODO: implement build
    return MaterialApp(
      theme: AppTheme().LightThemeMode,
      darkTheme: AppTheme().DarkThemeMode,

      themeMode: Provider.of<ThemeProvider>(context).switchvalue?ThemeMode.light:ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home:onboardingScreen() ,
    );
  }
}