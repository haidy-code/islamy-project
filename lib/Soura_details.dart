import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/main.dart';

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
    loadsoradetails(args.soura_index);
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
              '${args.sour_aname}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                            style: TextStyle(fontSize: 18),
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
