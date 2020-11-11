import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:testf/pages/addtask.dart';
import 'package:testf/pages/seenotes.dart';

class ClassAssignments extends StatefulWidget {
  @override
  _ClassAssignmentsState createState() => _ClassAssignmentsState();
}

class _ClassAssignmentsState extends State<ClassAssignments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Your Tasks'),

        /*
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.calendar_today),
            //tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt_sharp),
            //tooltip: 'Next page',
            onPressed: () {},
          ),
        ],
        */
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[50],
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
                    child: Text(
                      'All Tasks for Advanced Projects',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                  ),

                  //This is one item
                  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(

                      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Column(
                            children: [
                              Container(
                                width: 180,
                                //height: 50,
                                child: Text(
                                  'Finish presentation',
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    //decoration: TextDecoration.lineThrough
                                  ),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'November 11, 2020',
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
                          ),
                          Icon(Icons.notifications, color: Colors.orange[300]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0, 0],
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
                        onTap: () => print('Delete'),
                      ),
                    ],
                  ),

                  //This is the end of one assignment

                  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(

                      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Column(
                            children: [
                              Container(
                                width: 180,
                                //height: 50,
                                child: Text(
                                  'Submit journal',
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    //decoration: TextDecoration.lineThrough
                                  ),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'November 12, 2020',
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
                              primary: Colors.white,
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
                          ),
                          Icon(Icons.notifications, color: Colors.grey[300]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0, 0],
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
                        onTap: () => print('Delete'),
                      ),
                    ],
                  ),

                  //This is the end of one assignment

                  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(

                      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Column(
                            children: [
                              Container(
                                width: 180,
                                //height: 50,
                                child: Text(
                                  'Complete reflection',
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    //decoration: TextDecoration.lineThrough
                                  ),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'November 15, 2020',
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
                              primary: Colors.white,
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
                          ),
                          Icon(Icons.notifications, color: Colors.grey[300]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0, 0],
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
                        onTap: () => print('Delete'),
                      ),
                    ],
                  ),

                  //This is the end of one assignment





                  SizedBox(height: 15)
                ],
              ),
              Positioned(
                bottom: 10.0,
                right: 10.0,
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.orangeAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddTask()),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
