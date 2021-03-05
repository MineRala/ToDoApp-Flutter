import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      title: Row(
        children: [
          Text("Add ToDo" ,style: TextStyle(color: Colors.deepOrange),),
          Spacer(),
          IconButton(icon: Icon(Icons.cancel,color: Colors.black38,),
            onPressed:() =>Navigator.pop(context,),
          ),
        ],
      ),
      children: [
        Divider(
          color: Colors.deepOrange,
          thickness: 2,
        ),
        Container(
          width: 300,
          height: 130,
          padding:EdgeInsets.all(15) ,
          child:TextFormField(
            controller: textController,
            decoration: InputDecoration(
              hintText: ("Example"),
              border: InputBorder.none,
            ),
            autofocus: true,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text("Add",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            color: Colors.deepOrange,
            textColor: Colors.black,

            onPressed: (){
              if(textController.text.isNotEmpty) {
                Navigator.pop(context,textController.text);
              }
            },
          ),
        ),
      ],
    );
  }
}


