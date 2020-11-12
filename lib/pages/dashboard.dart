import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:testf/pages/seenotes.dart';
import 'dart:math';

import '../database_helper.dart';
import 'addclass.dart';
import 'addtask.dart';
import 'filterAssignments.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() {
    return _DashboardState();
  }

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
  //Color _iconColor = Colors.grey;
  Map<int, dynamic> confettiControllers = new Map<int, dynamic>();
  Map<int, dynamic> iconColors = new Map<int, dynamic>();

  Color noteColor = Colors.white;
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

  LinearGradient getLineGradient(Color color)
  {
    print(color.toString());
    return new LinearGradient(
      stops: [0.015, 0.015],
      colors: [color, Colors.white],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Your Tasks'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.calendar_today),
              //tooltip: 'Show Snackbar',

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilterAssignments(_dbHelper.getTasks())),
                ).then((value) {
                  setState(() {});
                });
              },
            ),

          ],
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
                                                decoration: BoxDecoration(
                                                  gradient: getLineGradient(Color(int.parse(snapshot.data[index].color.substring(6,16)))),
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
                                                                decoration: snapshot.data[index].isComplete == 1 ? TextDecoration.lineThrough : TextDecoration.none),
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

  }
}