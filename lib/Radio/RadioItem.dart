import 'package:flutter/material.dart';
import 'package:islamy_app/data/radio_response.dart';
import 'package:islamy_app/main.dart';

class RadioItem extends StatelessWidget {
  Radios radios;
  Function play;
  Function pause;

  RadioItem(this.radios, this.play, this.pause);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child:  Column(

       children: [
         Text('${radios.name??''}',style: TextStyle(color: Theme.of(context).cardColor,fontSize: 25,fontWeight: FontWeight.w300),),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             IconButton(onPressed: (){play(radios.radioUrl);}, icon: Icon(Icons.play_arrow,size: 40,color: Mythemedata.primarycolor,)),
             IconButton(onPressed: (){pause();}, icon: Icon(Icons.pause,size: 40,color: Mythemedata.primarycolor,))
           ],
         )
       ],
      ),

    );
  }
}
