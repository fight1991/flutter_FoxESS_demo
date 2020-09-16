import "package:flutter/material.dart";
class PlantList extends StatelessWidget {
  PlantList({Key key, @required this.type}): super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    return Text('哈哈-$type');
  }
}
