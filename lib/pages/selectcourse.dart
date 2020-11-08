import 'package:flutter/material.dart';

import 'addtask.dart';

class SelectCourse extends StatefulWidget {
  @override
  _SelectCourseState createState() => _SelectCourseState();
}

class _SelectCourseState extends State<SelectCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Select Class'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.cancel),
              //tooltip: 'Next page',
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          width: MediaQuery.of(context).size.width,
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            //This is one class
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
              padding: EdgeInsets.fromLTRB(30, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    //height: 50,
                    child: Text(
                      'Advanced Projects',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
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
                  stops: [0.015, 0.015],
                  colors: [Colors.orange[400], Colors.white],
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
            //This is the end of one class

            //This is one class
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
              padding: EdgeInsets.fromLTRB(30, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    //height: 50,
                    child: Text(
                      'AP Calculus AB',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
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
                  stops: [0.015, 0.015],
                  colors: [Colors.yellow[400], Colors.white],
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
            //This is the end of one class

            //This is one class
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
              padding: EdgeInsets.fromLTRB(30, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    //height: 50,
                    child: Text(
                      'AP Statistics',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
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
                  stops: [0.015, 0.015],
                  colors: [Colors.pink[400], Colors.white],
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
            //This is the end of one class

            //This is one class
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
              padding: EdgeInsets.fromLTRB(30, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    //height: 50,
                    child: Text(
                      'AP Physics C',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
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
                  stops: [0.015, 0.015],
                  colors: [Colors.green[400], Colors.white],
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
            //This is the end of one class

            //This is one class
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
              padding: EdgeInsets.fromLTRB(30, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    //height: 50,
                    child: Text(
                      'Contemporary World Problems',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
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
                  stops: [0.015, 0.015],
                  colors: [Colors.red[400], Colors.white],
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
            //This is the end of one class

            //This is one class
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
              padding: EdgeInsets.fromLTRB(30, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    //height: 50,
                    child: Text(
                      'Leadership',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
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
                  stops: [0.015, 0.015],
                  colors: [Colors.purple[400], Colors.white],
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
            //This is the end of one class

            //This is one class
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
              padding: EdgeInsets.fromLTRB(30, 13, 5, 13),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTask()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 180,
                      //height: 50,
                      child: Text(
                        'World Literature',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
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
                    color: Colors.grey[200],
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            //This is the end of one class
          ]),
        ));
  }
}
