import 'dart:ui';

import 'package:deneme/AddItem.dart';
import 'package:deneme/ModelListTile.dart';
import 'package:flutter/material.dart';

import 'M/Model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isCompleted = false;

  List<Model>ModelList = [
    Model(name: "Start the project", isComplete: false),
    Model(name: "Join online class.", isComplete: false,),];

  Widget appBarTitle =  Text("TO DO LIST");
  Icon actionIcon =  Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:  false ,
        backgroundColor: Color(0xff885666),
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon:actionIcon,
            color: Colors.white,
            onPressed: () {
              setState(() {
                if(this.actionIcon.icon == Icons.search){
                  this.actionIcon =  Icon(Icons.close);
                  this.appBarTitle =  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  );
                }
                else{
                  this.actionIcon = Icon(Icons.search);
                  this.appBarTitle = Text("TO DO LIST");
                }
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.input,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Container(
        padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
        child:
        Text("There are ${ModelList.length} items on the to-do list.",
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
        Expanded(
        child: Container(
          margin: EdgeInsets.all(10),
          padding:
          EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 70),
          height: double.minPositive,
          width: 600,
          child: ListView.builder(
              itemCount: ModelList.length,
              itemBuilder: (context, index) {
                return ModelListTile(
                  item: ModelList[index],
                  onDelete: () {
                    setState(() {
                      ModelList.removeAt(index);
                    });
                  },
                );
              }),
        ),
      ),
  ]),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String newTaskName = await showDialog(
              context: context,
              builder: (context) {
                return AddItem();
              });
          setState(() {
            ModelList.add(Model(name: newTaskName, isComplete: false));
          });
        },
        child: Icon(Icons.add,
            color: Colors.white),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

