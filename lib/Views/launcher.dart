import 'package:flutter/material.dart';
import 'package:kg_students/Components/appbar_custom.dart';
import 'package:kg_students/Components/drawer.dart';
import 'package:kg_students/Components/navigator_custom.dart';
import 'package:kg_students/Views/colors-screen.dart';
import 'package:kg_students/Views/websites-screen.dart';
import 'package:kg_students/Views/math-page.dart';

import 'alphabets-screen.dart';

//!!!!!!!!!!!!!!!!!!!!   luncher of the app !!!!!!!!!!!!!!!!!!!

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  //!list of screens
  List<Widget> screens = [
    WebsitesScreen(),
    ColorLearn(),
    AlphabetPage(),
    MathPage(),
  ];

  int screen = 0;
  String screenTitle = "";

  @override
  Widget build(BuildContext context) {
    pageTitle();
    return Scaffold(
      drawer: drawer(),
      appBar: appbarCustom(title: screenTitle),
      body: screens[screen],
      bottomNavigationBar: NavigatioBarCustom(
        indexpage: screen,
        onPress: (value) {
          setState(() {
            screen = value;
          });
        },
      ),
    );
  }

  //! determin screenTitlefor each screen
  void pageTitle() {
    switch (screen) {
      case 0:
        screenTitle = "Websites list";
        break;
      case 1:
        screenTitle = "Colors";
        break;
      case 2:
        screenTitle = "Alphabets";
        break;
      case 3:
        screenTitle = "Numbers";
        break;
      default:
        screenTitle = "Fun Learn";
    }
  }
}
