import 'package:flutter/material.dart';
import 'package:islamy_app/HomePage.dart';
import 'package:islamy_app/Soura_details.dart';

void main() {
  runApp(MyApp());
}

class Mythemedata {
  static final primarycolor = Color.fromRGBO(183, 147, 95, 1.0);
  static final selectedcolor = Color.fromRGBO(0, 0, 0, 1.0);
  static final unselectedcolor = Color.fromRGBO(255, 255, 255, 1.0);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Mythemedata.primarycolor,
          //change color of back arrow
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                  color: Colors.black)
          )
      ),
      routes: {
        HomePage.routename: (buildcontext) => HomePage(),
        Soura_details.routename: (buildcontext) => Soura_details()
      },
      initialRoute: HomePage.routename,
    );
  }
}
