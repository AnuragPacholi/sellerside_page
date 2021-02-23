import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  File imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.red600,
        elevation: 10,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(16, 2).white.make(),
        ]).pOnly(left: 14, top: 19),
      ),
      //Main Container.
      body: DraggableScrollableSheet(
          maxChildSize: 1,
          minChildSize: 1,
          initialChildSize: 1,
          expand: true,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.start,
              controller: scrollController,
              child: Container(
                child: Column(
                  children: <Widget>[
                    // 1st Container
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          55.heightBox,
                          Text(
                            'Upload your Product !',
                            style: TextStyle(
                                fontFamily:
                                    GoogleFonts.berkshireSwash().fontFamily,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Vx.red600),
                          ),
                        ],
                      ),
                    ),
                    // 2nd Container (Enter Title)
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.fromLTRB(10, 25, 0, 0)),
                          Text(
                            'Enter Title for the Product:',
                            style: TextStyle(
                                fontFamily: GoogleFonts.merienda().fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Vx.red600),
                          ),
                        ],
                      ),
                    ),

                    //3rd Container (Title Text Field)
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Vx.red200,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Vx.red400,
                                      blurRadius: 15,
                                      offset: Offset(0, 6))
                                ]),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Title',
                                  hintStyle: TextStyle(color: Vx.red400)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 4th Container (Enter Description)
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 0, 10)),
                          Text(
                            'Write Description of the Product:',
                            style: TextStyle(
                                fontFamily: GoogleFonts.merienda().fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Vx.red600),
                          ),
                        ],
                      ),
                    ),

                    //5th Container (Description Text Field)
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Vx.red200,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Vx.red400,
                                      blurRadius: 15,
                                      offset: Offset(0, 6))
                                ]),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write Description',
                                  hintStyle: TextStyle(color: Vx.red400)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 6th Container (Enter Price)
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 0, 10)),
                          Text(
                            'Enter Price for the Product:',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.merienda().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Vx.red600),
                          ),
                        ],
                      ),
                    ),

                    //7th Container (Price Text Field)
                    Container(
                      padding: EdgeInsets.fromLTRB(80, 10, 80, 20),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Vx.red200,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Vx.red400,
                                      blurRadius: 15,
                                      offset: Offset(0, 6))
                                ]),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Price',
                                  hintStyle: TextStyle(color: Vx.red400)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Container (Image Uploader)
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.fromLTRB(10, 50, 0, 0)),
                          Text(
                            'Upload Product Image:',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.merienda().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Vx.red600),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [Vx.red600, Vx.red500])),
                            child: IconButton(
                                color: Vx.gray100,
                                icon: Icon(Icons.photo_library),
                                onPressed: () =>
                                    _pickImage(ImageSource.gallery)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [Vx.red600, Vx.red500])),
                            child: IconButton(
                                color: Vx.gray100,
                                icon: Icon(Icons.photo_camera),
                                onPressed: () =>
                                    _pickImage(ImageSource.camera)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(220, 54, 54, 1),
                                  Color.fromRGBO(220, 54, 54, .8),
                                ])),
                            child: Center(
                              child: Text(
                                "Upload Product",
                                style: TextStyle(
                                    color: Vx.gray100,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.squadaOne().fontFamily),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
