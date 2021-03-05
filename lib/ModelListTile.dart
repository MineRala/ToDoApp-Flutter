import 'package:flutter/material.dart';
import 'M/Model.dart';

class ModelListTile extends StatelessWidget {
  final Model item;
  final Function onDelete;

  const ModelListTile(
      {Key key, this.item, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
        height: 15,
        width: 15 ,
        decoration: BoxDecoration(
        color: Colors.deepOrange,
        shape:BoxShape.circle,
       ),
     ),
      title: Text(
        item.name,
        style: TextStyle(color: Colors.black,
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Container(
        width: 50,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.delete), onPressed: onDelete,color: Colors.blueGrey,)
          ],
        ),
      ),
    );
  }
}
