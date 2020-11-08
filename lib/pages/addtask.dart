import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.cancel, color: Colors.grey[600]),
            //tooltip: 'Next page',
            onPressed: () {},
          ),
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
              padding: EdgeInsets.fromLTRB(13, 13, 0, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon:
                        Icon(Icons.calendar_today, color: Colors.orangeAccent),
                    //tooltip: 'Tap to open date picker',
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101),
                      );
                    },
                  ),
                  Column(
                    children: [
                      Container(
                        width: 300,
                        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        child: Text(
                          'Due date: October 29, 2020',
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
                          print(isSwitched);
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
            Container(
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
          ]),
        ));
  }
}
