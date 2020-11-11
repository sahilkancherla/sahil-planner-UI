import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:testf/pages/addclass.dart';

import '../database_helper.dart';
import 'classdetails.dart';

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
class _ClassesState extends State<Classes> {

  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Your Classes'),
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
                              future: _dbHelper.getClasses(),
                              builder: (context, snapshot){

                                return ScrollConfiguration(
                                  behavior: MyBehavior(),
                                  child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index){
                                    return(
                                        GestureDetector(
                                            onTap: () async {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => ClassDetails()),
                                              );
                                            },
                                        child: Slidable(
                                          actionPane: SlidableDrawerActionPane(),
                                          actionExtentRatio: 0.25,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
                                            padding: EdgeInsets.fromLTRB(25, 13, 5, 13),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                        snapshot.data[index].className,
                                                        style: TextStyle(
                                                            color: Colors.blueGrey[900],
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                        snapshot.data[index].teacherName,
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
                                                  await _dbHelper.deleteClass(snapshot.data[index].id);
                                                  //Navigator.pop(context);
                                                  setState((){

                                                  });
                                                }
                                              },
                                            ),
                                          ],
                                        )
                                        //This is the end of one class
                                    ));
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
                            builder: (context) => AddClass()),
                          ).then((value) {
                          setState(() {});
                        });
                    },
                    ),
                  )
                ]))));
  }
}
