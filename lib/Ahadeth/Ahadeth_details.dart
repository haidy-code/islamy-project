import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class Ahadeth_details extends StatefulWidget {
  static const String routename = 'ahadeth  details';

  @override
  _Ahadeth_detailsState createState() => _Ahadeth_detailsState();
}

class _Ahadeth_detailsState extends State<Ahadeth_details> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as AhadethDetailsArgs;
    if (verses.isEmpty) {
      loadhadethdetails(args.hadeth_index);
    }
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
              args.hadeth_aname,
              style: TextStyle(
                color: Theme
                    .of(context)
                    .cardColor,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .accentColor,
                borderRadius: BorderRadius.circular(12)),
            child: verses.isEmpty
                ? Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Mythemedata.primarycolor)))
                : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      verses[index],
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme
                              .of(context)
                              .cardColor),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loadhadethdetails(int hadeth_index) async {
    String filecontent =
    await rootBundle.loadString('assets/hadeth/h${hadeth_index + 1}.txt');
    List<String> hadeth = filecontent.split('\n');
    List<String> body = [];

    for (int i = 1; i < hadeth.length; i++) {
      body.add(hadeth[i]);
    }
    verses = body;

    setState(() {});
  }
}

class AhadethDetailsArgs {
  String hadeth_aname;
  int hadeth_index;

  AhadethDetailsArgs(this.hadeth_aname, this.hadeth_index);
}
