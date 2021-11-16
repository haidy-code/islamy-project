import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/main.dart';
import 'package:islamy_app/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class Sebha extends StatefulWidget {
  @override
  _SebhaState createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;

  List<String> tasbeh_list = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوه الا بالله'
  ];

  int current_index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: ontasbehaclick,
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset('assets/images/sebha_body.png'),
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(
                //     right: MediaQuery.of(context).size.height * 0.08),

                margin: provider.applang == 'en'
                    ? EdgeInsets.only(
                    left: MediaQuery
                        .of(context)
                        .size
                        .height * 0.145)
                    : EdgeInsets.only(
                    right: MediaQuery
                        .of(context)
                        .size
                        .height * 0.08),

                child: Image.asset('assets/images/sebha_head.png'),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                AppLocalizations.of(context)!.tasbeh_count,
                style: TextStyle(
                    fontSize: 25,
                    color: Theme
                        .of(context)
                        .cardColor,
                    fontWeight: FontWeight.w600),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Color.fromRGBO(183, 147, 95, 1.0),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(20),
            child: Text(
              '$counter',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Mythemedata.primarycolor,
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              '${tasbeh_list[current_index]}',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  void ontasbehaclick() {
    setState(() {
      counter++;
      angle = angle + 30;
      if (counter % 33 == 0) {
        if (current_index == 4) {
          current_index = 0;
          return;
        }

        current_index++;
      }
    });
  }
}
