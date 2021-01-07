import "package:flutter/material.dart";
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
          Icon(Icons.power),
          Text(label),
          Expanded(child: Text(value, textAlign: TextAlign.center))
        ],
      )
    );
  }
}