import 'package:flutter/material.dart';
import 'package:testf/models/classObject.dart';
import 'package:testf/pages/addtask.dart';
import 'package:testf/pages/dashboard.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../database_helper.dart';

class AddClass extends StatefulWidget {
  @override
  _AddClassState createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  bool isSwitched = false;
  Item selectedUser;
  Color currentColor = Colors.orange[400];
  List<Color> currentColors = [Colors.orange[400], Colors.green];

  String tempClassName = "";
  String tempTeacherName = "";
  /**

      List<Item> users = <Item>[
      const Item('Class 1'),
      const Item('Class 2'),
      const Item('Class 3'),
      const Item('Class 4'),
      const Item('Class 5'),
      const Item('Class 6'),
      const Item('Class 7'),
      ];
   **/

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) => setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,

        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.cancel, color: Colors.grey[700]),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          /*
          leading: IconButton(
            icon: Icon(Icons.cancel, color: Colors.grey[600]),
            //tooltip: 'Next page',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),*/
        ),
        body: Container(
          color: Colors.grey[100],
          width: MediaQuery.of(context).size.width,
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              //margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
              //margin: ,
              child: TextField(
                onSubmitted: (value) async {
                  if(value != ""){
                    tempClassName = value;

                  }
                },
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  //labelText: 'Enter Task Here',

                  hintText: 'New Class',
                  hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400]),
                ),
                autofocus: false,
              ),
            ),
            Container(
              width: 180,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.fromLTRB(25, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.notes_outlined, color: Colors.orangeAccent),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        width: 350,
                        child: TextField(
                          onSubmitted: (value) async {
                            if(value != ""){
                              tempTeacherName = value;

                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            //labelText: 'Enter Task Here',

                            hintText: 'Enter Teacher Name',
                            hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[400]),
                          ),
                          autofocus: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Container(
              width: 180,
              margin: EdgeInsets.fromLTRB(0, 1.5, 0, 0),
              padding: EdgeInsets.fromLTRB(12, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.circle),
                    color: currentColor,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: const EdgeInsets.all(0.0),
                            contentPadding: const EdgeInsets.all(0.0),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: currentColor,
                                onColorChanged: changeColor,
                                colorPickerWidth: 300.0,
                                pickerAreaHeightPercent: 0.7,
                                enableAlpha: true,
                                displayThumbColor: true,
                                showLabel: true,
                                paletteType: PaletteType.hsv,
                                pickerAreaBorderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(2.0),
                                  topRight: const Radius.circular(2.0),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5,0,0,0),
                    child: Column(
                        children: <Widget> [
                          Text(
                            'Select Color',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),

                        ]
                    ),
                  )



                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () async {
                DatabaseHelper _dbHelper = DatabaseHelper();
                ClassObject newClassObject = ClassObject(className: tempClassName, teacherName: tempTeacherName, color: currentColor.toString());
                await _dbHelper.insertClass(newClassObject);
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(120, 20, 120, 40),
                padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 80,
                      child: Text(
                        'Add class',
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.check,
                        color: Colors.orangeAccent,
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0],
                    colors: [Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
            )

          ]),
        ));
  }
}