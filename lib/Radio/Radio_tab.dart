import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:islamy_app/Radio/RadioItem.dart';
import 'package:islamy_app/data/radio_response.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';




class Radio_tab extends StatefulWidget {
  @override
  State<Radio_tab> createState() => _Radio_tabState();
}

class _Radio_tabState extends State<Radio_tab> {
  // @override
  // initState() {
  //   super.initState();
  //   getradios().then((radiorespnse){
  //    radiorespnse.radios!.forEach((radio) {print(radio.name); }) ;
  //   });
  //
  // }
  late AudioPlayer audioPlayer ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer=AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Expanded(flex: 2,child:
          Image.asset('assets/images/radio2.png')),
         FutureBuilder<RadioResponse>(
           future: getradios()
             ,builder: (buildcontext,snapchot){
             if(snapchot.hasError){
               return Center(child: Text(snapchot.error.toString()));
             }
             else if (snapchot.connectionState ==
                 ConnectionState.waiting) {
               return Expanded(flex: 1,child: Center(child: CircularProgressIndicator()));
             }
             return  Expanded(flex: 1,child: ListView.builder(
               physics: PageScrollPhysics()
               ,itemBuilder: (buildcontext2,index){
               return RadioItem(snapchot.data!.radios!.elementAt(index), radioplay, radiostop);
             },itemCount: snapchot.data?.radios?.length??0,scrollDirection: Axis.horizontal,));
         })


        ],
      ),
    );
  }

  Future<RadioResponse> getradios() async {
    http.Response response= await http.get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
    var radioresonse=RadioResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    if (response.statusCode == 200) {
      return radioresonse;
    }
// wsl lserver bs feh moshkla fe respnse nafso
    if (radioresonse.message != null)
      throw Exception(radioresonse.message);
// mawslsh lserver aslan
    throw Exception("error reaching server");
  }
  void radioplay(String url)  {
    audioPlayer.stop();//3shan lw kan feh 7aga sha8ala ywa2afha alawl
    audioPlayer.play(url);
   
  }
  void radiostop()  {

    audioPlayer.pause();

  }
}
