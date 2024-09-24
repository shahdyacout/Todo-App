import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class ThemeProvider extends ChangeNotifier{
  bool switchvalue=false;
  ChangeSwitchValue (bool t)async{
    switchvalue=t;
    var box=Hive.box("settingsBox");
    await box.put("switchValue", t);

    notifyListeners();
  }

  void setswitchValueFromHive() async{
    var box=Hive.box("settingsBox");
    switchvalue=await box.get("switchValue")??false;
    notifyListeners();
  }
}