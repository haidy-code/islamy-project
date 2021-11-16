import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/providers/AppConfigProvider.dart';
import 'package:islamy_app/settings/Settings.dart';
import 'package:provider/provider.dart';

import 'file:///C:/flutter%20projects/islamy_app/lib/Radio/Radio_tab.dart';
import 'file:///C:/flutter%20projects/islamy_app/lib/Sebha/Sebha.dart';

import 'Ahadeth/Ahadeth.dart';
import 'Quran/Quran.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  static const String routename = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Image.asset(
          provider.apptheme == ThemeMode.light
              ? 'assets/images/main-bachground.png'
              : 'assets/images/main_background_dark.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: TextStyle(
                color: Theme.of(context).cardColor,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme
                .of(context)
                .primaryColor),
            child: BottomNavigationBar(
              onTap: (index) {
                currentpage = index;
                setState(() {});
              },
              currentIndex: currentpage,
              backgroundColor: Mythemedata.primarycolor,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/quran.png',
                      width: 36,
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/book.png',
                      width: 36,
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/sebha.png',
                      width: 36,
                    ),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/radio.png',
                      width: 36,
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: views[currentpage],
        ),
      ],
    );
  }

  List<Widget> views = [Quran(), Ahadeth(), Sebha(), Radio_tab(), Settings()];

  Widget getcurrentpage() {
    if (currentpage == 0) {
      return Quran();
    } else if (currentpage == 1) {
      return Ahadeth();
    } else if (currentpage == 2) {
      return Sebha();
    } else if (currentpage == 3) {
      return Radio_tab();
    } else {
      return Settings();
    }
    ;
  }
}
