import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:testf/pages/seenotes.dart';
import 'dart:math';

import '../database_helper.dart';
import 'addclass.dart';
import 'addtask.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();

}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child,
      AxisDirection axisDirection) {
    return child;
  }
}

class _DashboardState extends State<Dashboard> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  bool checkBoxValue = false;
  Map<int, dynamic> confettiControllers = new Map<int, dynamic>();
  @override
  void initState() {
    super.initState();

  }
  ConfettiController getController(int id)
  {
      if(confettiControllers[id] == null)
        {
          confettiControllers[id] = new ConfettiController(
            duration: new Duration(seconds: 1),
          );
        }

      return confettiControllers[id];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Your Tasks'),
        ),
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Column(
                    //scrollDirection: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(

                            child: FutureBuilder(
                                initialData: [],
                                future: _dbHelper.getTasks(),
                                builder: (context, snapshot){

                                  return ScrollConfiguration(
                                    behavior: MyBehavior(),
                                    child: ListView.builder(
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
                                                    ConfettiWidget(
                                                      blastDirection: pi/2,
                                                      blastDirectionality: BlastDirectionality.explosive,
                                                      confettiController: getController(snapshot.data[index].id),
                                                      particleDrag: 0.05,
                                                      emissionFrequency: 0.05,
                                                      numberOfParticles: 40,
                                                      gravity: 0.3,
                                                      shouldLoop: false,
                                                      colors: [
                                                        Colors.green,
                                                        Colors.red,
                                                        Colors.yellow,
                                                        Colors.blue,
                                                      ],
                                                    ),
                                                    Checkbox(
                                                        value: snapshot.data[index].isComplete == 1,
                                                        activeColor: Colors.green[400],
                                                        onChanged:  (bool value)  {
                                                          setState(()  {
                                                            DatabaseHelper _dbHelper = DatabaseHelper();
                                                             _dbHelper.updateCompletionStatus(value, snapshot.data[index].id);
                                                            if(value)
                                                            {
                                                                getController(snapshot.data[index].id).play();
                                                            }
                                                          });
                                                        }
                                                    ),
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
                                                /**
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
                                                    **/
                                        /**
                                            Slidable(
                                              actionPane: SlidableDrawerActionPane(),
                                              actionExtentRatio: 0.25,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
                                                padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: 180,
                                                          child: Text(
                                                            snapshot.data[index].taskName,
                                                            style: TextStyle(
                                                                color: Colors.blueGrey[900],
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 180,
                                                          child: Text(
                                                            snapshot.data[index].className,
                                                           //"className",
                                                            style: TextStyle(
                                                                color: Colors.grey[400],
                                                                fontWeight: FontWeight.w400),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 180,
                                                          child: Text(
                                                           snapshot.data[index].dueDate,
                                                           //"dueDate",
                                                            style: TextStyle(
                                                                color: Colors.grey[400],
                                                                fontWeight: FontWeight.w400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Icon(Icons.chevron_right, color: Colors.grey[500]),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    stops: [0.015, 0.015],
                                                    colors: [Colors.orange[400], Colors.white],
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
                                            **/
                                            //This is the end of one class
                                        );
                                      },
                                    ),);
                                }
                            )
                        )






                      ]),
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
                ]))));
  /**
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tasks'),

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
                      'Today',
                      style: TextStyle(
                          fontSize: 13,
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
                      padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.radio_button_checked_outlined,
                              color: Colors.green[400]),
                          Column(
                            children: [
                              Container(
                                width: 180,
                                child: Text(
                                  'Finish book questions',
                                  style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'AP Physics C',
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
                        onTap: () => print('Delete'),
                      ),
                    ],
                  ),
                  //This is the end of one assignment

                  //This is one item
                  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.radio_button_off, color: Colors.grey[400]),
                          Column(
                            children: [
                              Container(
                                width: 180,
                                child: Text(
                                  'Send project file',
                                  style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'World Literature',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'See notes',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.notifications, color: Colors.grey[300]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.015, 0.015],
                          colors: [Colors.blue[400], Colors.white],
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

                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 15),
                    child: Text(
                      'Tomorrow',
                      style: TextStyle(
                          fontSize: 13,
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
                      padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.radio_button_off, color: Colors.grey[400]),
                          Column(
                            children: [
                              Container(
                                width: 180,
                                child: Text(
                                  'Submit history FRQ',
                                  style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'Contemporary World Problems',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'See notes',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Icon(Icons.notifications, color: Colors.grey[300]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.015, 0.015],
                          colors: [Colors.red[400], Colors.white],
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

                  //This is one item
                  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.radio_button_off, color: Colors.grey[400]),
                          Column(
                            children: [
                              Container(
                                width: 180,
                                child: Text(
                                  'Finish practice quiz',
                                  style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'AP Calculus BC',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'See notes',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.notifications, color: Colors.grey[300]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.015, 0.015],
                          colors: [Colors.yellow[600], Colors.white],
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

                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 15),
                    child: Text(
                      'November 1st, 2020',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: Text(
                            'No assignments yet today',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
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
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 15),
                    child: Text(
                      'November 2nd, 2020',
                      style: TextStyle(
                          fontSize: 13,
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
                      padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.radio_button_off, color: Colors.grey[400]),
                          Column(
                            children: [
                              Container(
                                width: 180,
                                child: Text(
                                  'Complete Lab Entry',
                                  style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'AP Physics C',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'See notes',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Icon(Icons.notifications, color: Colors.grey[300]),
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
                        onTap: () => print('Delete'),
                      ),
                    ],
                  ),
                  //This is the end of one assignment

                  //This is one item
                  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.radio_button_off, color: Colors.grey[400]),
                          Column(
                            children: [
                              Container(
                                width: 180,
                                child: Text(
                                  'Finish Chapter 1',
                                  style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  'World Literature',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'See notes',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.notifications, color: Colors.grey[300]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.015, 0.015],
                          colors: [Colors.blue[400], Colors.white],
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
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          width: 180,
                          child: Text(
                            'See recent assignments',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.grey[500],
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
                  Container(
                    margin: EdgeInsets.fromLTRB(80, 0, 80, 40),
                    padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          width: 180,
                          child: Text(
                            'Load more assignments',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.grey[500],
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
      **/
  }
}
