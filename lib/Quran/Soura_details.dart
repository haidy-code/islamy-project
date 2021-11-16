import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/main.dart';
import 'package:islamy_app/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class Soura_details extends StatefulWidget {
  static const String routename = 'souradetails';

  @override
  _Soura_detailsState createState() => _Soura_detailsState();
}

class _Soura_detailsState extends State<Soura_details> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SoraDetailsArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadsoradetails(args.soura_index);
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
              '${args.sour_aname}',
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
                : ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      verses[index] + '${index + 1}',
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
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Mythemedata.primarycolor,
                        width: double.infinity,
                        height: 1,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> loadsoradetails(int soura_index) async {
    String filecontent =
        await rootBundle.loadString('assets/files/${soura_index + 1}.txt');
    //print(filecontent);
    List<String> ayat = filecontent.split('\n');
    verses = ayat;
    setState(() {});
  }
}

class SoraDetailsArgs {
  String sour_aname;
  int soura_index;

  SoraDetailsArgs(this.sour_aname, this.soura_index);
}
