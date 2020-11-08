import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tasks'),
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
      ),
      body: Container(
        color: Colors.grey[50],
        width: MediaQuery.of(context).size.width,
        child: ListView(
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
                    Text(
                      'See notes',
                      style: TextStyle(color: Colors.grey[400]),
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
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
                      child: Icon(Icons.delete_outline, color: Colors.red[500]),
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
      ),
    );
  }
}
