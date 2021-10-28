import 'package:flutter/material.dart';

import 'file:///C:/flutter%20projects/islamy_app/lib/Ahadeth/Ahadeth_details.dart';

class Ahadeth_name_item extends StatelessWidget {
  String hadethname;
  int index;

  Ahadeth_name_item(this.hadethname, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Ahadeth_details.routename,
            arguments: AhadethDetailsArgs(hadethname, index));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            hadethname,
            style: TextStyle(fontSize: 25, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
