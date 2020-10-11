import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File _imageFile;

  _openGallery()async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera()async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Center(child: Text('Make a Choice', style: TextStyle(color: Colors.teal),)),
        content: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                child: Icon(Icons.photo_library, size: 40,color: Colors.lightGreen,),
                onTap: (){
                  _openGallery();
                },
              ),

              Padding(padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),),

              GestureDetector(
                child: Icon(Icons.camera, size: 40,color: Colors.lightGreen,),
                onTap: (){
                  _openCamera();
                },
              ),

            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                height: 500.0,
                width: double.infinity,
                color: Colors.white,
                child: _imageFile == null ? Center(child: Text('Image not Selected!')):Image.file(_imageFile),
              ),

              RaisedButton(
                color: Colors.teal,
                child: Text('Select Image', style: TextStyle(color: Colors.white),),
                onPressed: (){
                  _showChoiceDialog();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
