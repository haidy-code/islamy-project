import 'package:flutter/material.dart';

import 'Soura_details.dart';

class Sura_name_item extends StatelessWidget {
  String suraname;
  int index;

  Sura_name_item(this.suraname, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Soura_details.routename,
            arguments: SoraDetailsArgs(suraname, index));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              '${suraname}',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
