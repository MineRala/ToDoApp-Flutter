import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();


  String _locationMessage = "";

  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff885666),
        title: Text("PROFILE"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 40,
            ),
            location(),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: _imageFile == null
              ? AssetImage('assets/profile.png')
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: ((builder) => bottomSheet()));
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.grey,
              size: 30,
            ),
          ),
        )
      ]
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Photo",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(onPressed: () {
                takePhoto(ImageSource.camera);
              }, icon: Icon(Icons.camera), label: Text("Camera")),
              FlatButton.icon(onPressed: () {
                takePhoto(ImageSource.gallery);
              }, icon: Icon(Icons.image), label: Text("Gallery")),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final Pickedfile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = Pickedfile;
    });
  }

@override
Widget location() {
  return Container(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_locationMessage,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
          FlatButton(
              onPressed: () {
                _getCurrentLocation();
                },
              child: Text("Find Location",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
              color: Colors.deepOrange,
          )
        ]
    ),
  );
 }
}