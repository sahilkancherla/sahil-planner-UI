import 'package:flutter/material.dart';

class SeeNotes extends StatefulWidget {
  @override
  _SeeNotesState createState() => _SeeNotesState();
}

class _SeeNotesState extends State<SeeNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,

        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.cancel, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Notes'),
          //backgroundColor: Colors.white,
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
              width: 180,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.fromLTRB(25, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        width: 360,
                        child: Text(
                          'I do indeed believe that this hw will take a long time and I think that it would be much better for me if i did not',
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
          ]),
        ));
  }
}
