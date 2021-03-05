
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username,password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885666),
        title: Text("LOG IN"),
      ),
      body: Form(
        key: _formKey,
        child:Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.normal,fontSize: 30,),
            ),
            SizedBox(height: 60.0),
            TextFormField(
                  decoration:InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:Colors.lightBlue),
                  ),
                    labelText: "Username:",
                    labelStyle: TextStyle(color: Colors.red),
                    border: UnderlineInputBorder(),
                  ),
                validator: (value){
                    if(value.isEmpty){
                      return "Enter Username:";
                    }else
                    return null;
                },
                onSaved: (value){
                    username = value;
                },
              ),
            SizedBox(height:5.0),
            TextFormField(
              decoration:InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:Colors.lightBlue),
                ),
                labelText: "Password:",
                labelStyle: TextStyle(color: Colors.red),
                border: UnderlineInputBorder(),
              ),
              validator: (value){
                if(value.isEmpty){
                  return "Enter Password:";
                }else
                  return null;
              },
              onSaved: (value){
                password = value;
              },
            ),
            SizedBox(height:15.0),
            loginButton(),
          ],
        ),
       ),
      ),
    );
  }

  Widget loginButton() => RaisedButton(
      child: Text("Log In"),
      onPressed:(){
        if(_formKey.currentState.validate()){
          _formKey.currentState.save();
          if (username == "mine-rala@hotmail.com" && password =="123456"){
            Navigator.pushNamed(context,"/navigationBarPage");
          }
          else{
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text("Login is wrong"),
                    actions: <Widget>[
                      MaterialButton(
                        child: Text("Turn Back"),
                        onPressed : () => Navigator.pop(context)
                      )
                    ],
                  );
                }
              );
          }
        }
  });

}
