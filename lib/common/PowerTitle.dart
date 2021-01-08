import "package:flutter/material.dart";
import "./MyIcons.dart";
class PowerTitle extends StatelessWidget {
  final String label;
  final String value;
  PowerTitle({Key key, this.label, this.value}):super(key: key);
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Icon(MyIcons.elec, color: Color(0xff3390ff),),
          Text(label),
          Expanded(child: Text(value, textAlign: TextAlign.center))
        ],
      )
    );
  }
}