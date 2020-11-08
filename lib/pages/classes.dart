import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Your Classes'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
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
            Slidable(
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
                            'Advanced Projects',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            'Mrs. Kankelborg',
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
                    ),
                  ),
                  onTap: () => print('Delete'),
                ),
              ],
            ),
            //This is the end of one class

            //This is one class
            Slidable(
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
                            'AP Calculus AB',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            'Mr. Sturtevant',
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
                    colors: [Colors.yellow[400], Colors.white],
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
                    ),
                  ),
                  onTap: () => print('Delete'),
                ),
              ],
            ),
            //This is the end of one class

            //This is one class
            Slidable(
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
                            'AP Statistics',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            'Mrs. Smith',
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
                    colors: [Colors.pink[400], Colors.white],
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
                    ),
                  ),
                  onTap: () => print('Delete'),
                ),
              ],
            ),
            //This is the end of one class

            //This is one class
            Slidable(
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
                            'AP Physics C',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            'Mr. Saxby',
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
                    ),
                  ),
                  onTap: () => print('Delete'),
                ),
              ],
            ),
            //This is the end of one class

            //This is one class
            Slidable(
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
                            'Contemporary World Problems',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            'Mrs. Sheffels',
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
                    ),
                  ),
                  onTap: () => print('Delete'),
                ),
              ],
            ),
            //This is the end of one class

            //This is one class
            Slidable(
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
                            'Leadership',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            'Mrs. Smith',
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
                    colors: [Colors.purple[400], Colors.white],
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
                    ),
                  ),
                  onTap: () => print('Delete'),
                ),
              ],
            ),
            //This is the end of one class

            //This is one class
            Slidable(
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
                            'World Literature',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            'Mr. Bresnahan',
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
                    ),
                  ),
                  onTap: () => print('Delete'),
                ),
              ],
            ),
            //This is the end of one class
          ]),
        ));
  }
}
