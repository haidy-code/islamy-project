import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/HomePage.dart';
import 'package:islamy_app/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import 'file:///C:/flutter%20projects/islamy_app/lib/Ahadeth/Ahadeth_details.dart';
import 'file:///C:/flutter%20projects/islamy_app/lib/Quran/Soura_details.dart';

void main() {
  runApp(ChangeNotifierProvider<AppConfigProvider>(
      create: (buildContext) {
        return AppConfigProvider();
      },
      child: MyApp()));
}

class Mythemedata {
  static final primarycolor = Color.fromRGBO(183, 147, 95, 1.0);
  static final primarycolordark = Color.fromRGBO(20, 26, 46, 1.0);
  static final accentcolordark = Color.fromRGBO(250, 204, 29, 1.0);
  static final selectedcolor = Color.fromRGBO(0, 0, 0, 1.0);
  static final unselectedcolor = Color.fromRGBO(255, 255, 255, 1.0);
  static final ThemeData lighttheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      cardColor: Color.fromRGBO(0, 0, 0, 1.0),
      accentColor: Color.fromRGBO(255, 255, 255, 1.0),
      primaryColor: Mythemedata.primarycolor,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 30)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Mythemedata.selectedcolor,
          unselectedItemColor: Mythemedata.unselectedcolor));
  static final ThemeData darktheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: Mythemedata.primarycolordark,
      cardColor: Color.fromRGBO(255, 255, 255, 1.0),
      accentColor: Color.fromRGBO(20, 26, 46, 1.0),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 30)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Mythemedata.accentcolordark,
          unselectedItemColor: Colors.white));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applang),
      theme: Mythemedata.lighttheme,
      darkTheme: Mythemedata.darktheme,
      themeMode: provider.apptheme,
      routes: {
        HomePage.routename: (buildcontext) => HomePage(),
        Soura_details.routename: (buildcontext) => Soura_details(),
        Ahadeth_details.routename: (buildcontext) => Ahadeth_details()
      },
      initialRoute: HomePage.routename,
    );
  }
}
