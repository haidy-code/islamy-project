import 'package:flutter/material.dart';

import 'file:///C:/flutter%20projects/islamy_app/lib/Ahadeth/Ahadeth_name_item.dart';

import '../main.dart';

class Ahadeth extends StatelessWidget {
  final List<String> ahadethnames = [
    "الحديث الأول",
    'الحديث الثاني',
    'الحديث الـثـالـث',
    'الحديث الـرابع',
    'الحديث الخامس',
    'الحديث السادس',
    'الحديث السابع',
    'لحديث الثامن',
    'الحديث التاسع',
    'الحديث العاشر',
    'الحديث الحادي عشر',
    'الحديث الثاني عشر',
    'الحديث الثالث عشر',
    'الحديث الرابع عشر',
    'الحديث الخامس عشر',
    'الحديث السادس عشر',
    'الحديث السابع عشر',
    'الحديث الثامن عشر',
    'الحديث التاسع عشر',
    'الحديث العشرون',
    'الحديث الواحد و عشرون',
    'الحديث الاثنين و عشرون',
    'الحديث الثالث و عشرون',
    'الحديث الرابع و عشرون',
    'الحديث الخامس و عشرون',
    'الحديث السادس و عشرون',
    'الحديث السابع و عشرون',
    'الحديث التامن و عشرون',
    'الحديث التاسع و عشرون',
    'الحديث الثلاثون',
    'الحديث الواحد و ثلاثون',
    'الحديث الاثنين و ثلاثون',
    'الحديث الثالث و ثلاثون',
    'الحديث الرابع و ثلاثون',
    'الحديث الخامس و ثلاثون',
    'الحديث السادس و ثلاثون',
    'الحديث السابع و ثلاثون',
    'الحديث التامن و ثلاثون',
    'الحديث التاسع و ثلاثون',
    'الحد يث الأربعون',
    'الحديث الواحد و الأربعون',
    'الحديث الاثنين و الأربعون',
    'الحديث الثالث والأربعون',
    'الحديث الرابع و الأربعون',
    'الحديث الخامس و الأربعون',
    'الحديث السادس و الأربعون',
    'الحديث السابع و الأربعون',
    'الحديث التامن و الأربعون',
    'الحديث التاسع و الأربعون',
    'الحديث الخمسون'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1, child: Image.asset('assets/images/hadeth_top_icon.png')),
        Container(
          color: Mythemedata.primarycolor,
          width: double.infinity,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'ahadeth',
            style: TextStyle(fontSize: 25, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: Mythemedata.primarycolor,
          width: double.infinity,
          height: 1,
        ),
        Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Ahadeth_name_item(ahadethnames[index], index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Mythemedata.primarycolor,
                    width: double.infinity,
                    height: 1,
                  );
                },
                itemCount: ahadethnames.length,
              ),
            )),
      ],
    );
  }
}
