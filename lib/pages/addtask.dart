// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:testf/models/taskObject.dart';
import 'package:testf/pages/dashboard.dart';
import 'package:testf/pages/seenotes.dart';
import 'package:intl/intl.dart';

import '../database_helper.dart';
import 'home.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class Item {
  const Item(this.name);
  final String name;
}

class _AddTaskState extends State<AddTask> {


  bool isSwitched = false;
  Item selectedClass;
  String tempTaskName = "";
  String tempNotes = "";
  DateTime selectedDate = DateTime.now();
  String stringDate;


  List<Item> users = <Item>[
    const Item('Class 1'),
    const Item('Class 2'),
    const Item('Class 3'),
    const Item('Class 4'),
    const Item('Class 5'),
    const Item('Class 6'),
    const Item('Class 7'),
  ];

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        stringDate = new DateFormat.yMMMMd().format(selectedDate);
      });
  }

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
                    tempTaskName = value;

                  }
                },
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  //labelText: 'Enter Task Here',

                  hintText: 'New Task',
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
                              tempNotes = value;

                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            //labelText: 'Enter Task Here',

                            hintText: 'Enter Notes',
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
              padding: EdgeInsets.fromLTRB(25, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.class_, color: Colors.orangeAccent),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        width: 350,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Item>(
                            hint: Text("  Select item"),
                            value: selectedClass,
                            onChanged: (Item Value) {
                              setState(() {
                                selectedClass = Value;
                              });
                            },
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                            items: users.map((Item user) {
                              return DropdownMenuItem<Item>(
                                value: user,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
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
              padding: EdgeInsets.fromLTRB(13, 13, 0, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      icon:
                      Icon(Icons.calendar_today, color: Colors.orangeAccent),
                      //tooltip: 'Tap to open date picker',
                      onPressed: () => _selectDate(context)


                  ),
                  Column(
                    children: [
                      Container(
                        width: 300,
                        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        child: Text(
                          stringDate = new DateFormat.yMMMMd().format(selectedDate),
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
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
              padding: EdgeInsets.fromLTRB(25, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.notifications, color: Colors.orangeAccent),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        width: 180,
                        child: Text(
                          'Important',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(110, 0, 0, 0),
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeTrackColor: Colors.orangeAccent,
                      activeColor: Colors.orange,
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
                TaskObject newTaskObject = new TaskObject(taskName: tempTaskName, notes: tempNotes, className: selectedClass.name, dueDate: stringDate);
                int i = 10;
                print(newTaskObject.taskName);
                await _dbHelper.insertTask(newTaskObject);
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
                        'Add task',
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
    /**
        Container(
        margin: EdgeInsets.fromLTRB(120, 20, 120, 40),
        padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(
        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
        width: 80,
        child: TextButton(
        child: Text('Add task'),
        //style: TextStyle(color: Colors.grey[400]),
        style: TextButton.styleFrom(
        primary: Colors.grey[700],
        ),
        onPressed: () {
        setState(
        () {
        Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => Home()));
        },
        );
        },
        )
        /**
     * TextButton(
        child: Text('See Notes'),
        //style: TextStyle(color: Colors.grey[400]),
        style: TextButton.styleFrom(
        primary: Colors.grey[700],
        ),
        onPressed: () {
        setState(
        () {
        Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => SeeNotes()));
        },
        );
        },
        )
        Text(
        'Add task',
        style: TextStyle(
        color: Colors.orangeAccent,
        fontWeight: FontWeight.w600,
        fontSize: 17),
        ),
     **/
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
        ]),
        ));
     **/
  }
}