import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        Image.asset(
          'assets/images/main-bachground.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'islamy',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Mythemedata.primarycolor),
            child: BottomNavigationBar(
              onTap: (index) {
                currentpage = index;
                setState(() {});
              },
              currentIndex: currentpage,
              backgroundColor: Mythemedata.primarycolor,
              selectedItemColor: Mythemedata.selectedcolor,
              unselectedItemColor: Mythemedata.unselectedcolor,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/quran.png',
                      width: 36,
                    ),
                    label: 'quran'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/book.png',
                      width: 36,
                    ),
                    label: 'ahadeth'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/sebha.png',
                      width: 36,
                    ),
                    label: 'sebha'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/radio.png',
                      width: 36,
                    ),
                    label: 'radio'),
              ],
            ),
          ),
          body: getcurrentpage(),
        ),
      ],
    );
  }

  Widget getcurrentpage() {
    if (currentpage == 0) {
      return Quran();
    } else if (currentpage == 1) {
      return Ahadeth();
    } else if (currentpage == 2) {
      return Sebha();
    } else {
      return Radio_tab();
    }
    ;
  }
}
