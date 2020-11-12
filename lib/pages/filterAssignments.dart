import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:testf/models/taskObject.dart';
import 'package:testf/pages/addtask.dart';
import 'package:testf/pages/seenotes.dart';

import '../database_helper.dart';

class FilterAssignments extends StatefulWidget {
  final Future<List<TaskObject>> allAssignments;
  FilterAssignments(this.allAssignments, {Key key}) : super (key: key);
  @override
  _FilterAssignmentsState createState() => _FilterAssignmentsState();
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child,
      AxisDirection axisDirection) {
    return child;
  }
}
class _FilterAssignmentsState extends State<FilterAssignments> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  Map<int, dynamic> iconColors = new Map<int, dynamic>();
  Color noteColor = Colors.white;
  Map<int, dynamic> confettiControllers = new Map<int, dynamic>();
  DateTime selectedDate = DateTime.parse(DateTime.now().toString().substring(0, 11) + "00:00:00.000");
  String stringDate;
  String displayDate;


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
        stringDate = selectedDate.toString();
        print(stringDate);
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Assignments'),




      ),
      body:
        Container(
        child: SafeArea(
            child: Stack(children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        //scrollDirection: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: FutureBuilder(
                                    initialData: [],
                                    future: _dbHelper.getTasksByDate(selectedDate),
                                    //future: _dbHelper.getTasksWithDate(selectedDate),
                                    builder: (context, snapshot){
                                      return SingleChildScrollView(
                                          //behavior: MyBehavior(),
                                        physics: ScrollPhysics(),
                                          child: Column( children: [
                                            Container(
                                              //width: 180,
                                              //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                              padding: EdgeInsets.fromLTRB(25, 13, 5, 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[

                                                  Column(

                                                    children: [
                                                      Container(

                                                        //width: 180,
                                                        child: Text(
                                                          'Select Date',
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
                                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                              padding: EdgeInsets.fromLTRB(13, 0, 0, 5),
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
                                                        //padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                                        child: Text(
                                                          displayDate = new DateFormat.yMMMMd().format(selectedDate),
                                                          style: TextStyle(
                                                              color: Colors.grey[600],
                                                              fontWeight: FontWeight.w400,
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

                                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                              child: Text(
                                                "All tasks for " + displayDate + ":",
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17),
                                              ),
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,

                                            itemCount: snapshot.data.length,
                                            itemBuilder: (context, index){
                                            return(
                                                Slidable(
                                                  actionPane: SlidableDrawerActionPane(),
                                                  actionExtentRatio: 0.25,
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                                                    padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[

                                                        /**
                                                            IconButton(
                                                            icon: Icon(Icons.radio_button_unchecked_outlined),
                                                            color: Colors.green[400],
                                                            onPressed: ()
                                                            {
                                                            setState(()
                                                            {
                                                            icon: Icons.radio_button_checked_outlined;
                                                            });
                                                            }
                                                            ),
                                                         **/
                                                        Column(
                                                          children: [
                                                            Container(
                                                              width: 180,
                                                              child: Text(
                                                                snapshot.data[index].taskName,
                                                                style: TextStyle(
                                                                    color: Colors.blueGrey[900],
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 15,
                                                                    decoration: TextDecoration.none),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 180,
                                                              child: Text(
                                                                snapshot.data[index].className,
                                                                style: TextStyle(
                                                                    color: Colors.grey[400],
                                                                    fontWeight: FontWeight.w400),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 180,
                                                              child: Text(
                                                                new DateFormat.yMMMMd().format(DateTime.parse(snapshot.data[index].dueDate)),
                                                                style: TextStyle(
                                                                    color: Colors.grey[400],
                                                                    fontWeight: FontWeight.w400),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TextButton(
                                                          child: Text('See Notes'),
                                                          //style: TextStyle(color: Colors.grey[400]),


                                                          style: TextButton.styleFrom(
                                                              primary: iconColors[snapshot.data[index].id] = (snapshot.data[index].notes == "" ? Colors.white : Colors.grey[700])
                                                          ),
                                                          onPressed: () {
                                                            setState(
                                                                  () {
                                                                if(snapshot.data[index].notes != "")
                                                                {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => SeeNotes(snapshot.data[index].notes)));
                                                                }

                                                              },
                                                            );
                                                          },
                                                        ),
                                                        IconButton(
                                                          icon: Icon(Icons.notifications),
                                                          //color: Colors.orange,
                                                          color: iconColors[snapshot.data[index].id] = (snapshot.data[index].isImportant == 1 ? Colors.orange : Colors.grey),
                                                          onPressed: () {
                                                            setState(() {
                                                              DatabaseHelper _dbHelper = DatabaseHelper();
                                                              if(iconColors[snapshot.data[index].id] == Colors.orange)
                                                              {
                                                                iconColors[snapshot.data[index].id] = Colors.grey;
                                                              }
                                                              else
                                                                iconColors[snapshot.data[index].id] = Colors.orange;

                                                              _dbHelper.updateImportanceStatus(iconColors[snapshot.data[index].id] == Colors.orange, snapshot.data[index].id);
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        stops: [0.015, 0.015],
                                                        colors: [Colors.green[400], Colors.white],
                                                      ),
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(5.0),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey[300],
                                                          blurRadius: 10.0,
                                                          spreadRadius: 5.0,
                                                          offset: Offset(0.0, 0.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  secondaryActions: <Widget>[
                                                    SlideAction(
                                                      child: Container(
                                                        padding: EdgeInsets.only(bottom: 10),
                                                        child: Container(
                                                          height: 35,
                                                          width: 35,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(50),
                                                              color: Colors.red[200]),
                                                          child: Icon(Icons.delete_outline,
                                                              color: Colors.red[500]),
                                                        ),
                                                      ),
                                                      onTap: () async {
                                                        if(snapshot.data[index].id != 0) {
                                                          await _dbHelper.deleteTask(snapshot.data[index].id);
                                                          //Navigator.pop(context);
                                                          setState((){

                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                )

                                                //This is the end of one class
                                            );
                                          },
                                        ),
                                          ])

                                        );
                                    }
                                )
                            )






                          ]),

                  )]
                ))



      ),
    );
  }
}
