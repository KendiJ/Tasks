import 'package:flutter/material.dart';


class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
           
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu),
                  Icon(Icons.search)
                ],
              ),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                color: Colors.orange[300]
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "My Tasks", 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                  color: Colors.black)
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  child: Icon(Icons.calendar_today),
                  radius: 35,
                  backgroundColor: Colors.teal,
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.av_timer, color: Colors.black,),
                  backgroundColor: Colors.red[200],
                  radius: 30,
                ),
                SizedBox(width: 10),
                Text("To Do", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.cloud_circle, color: Colors.black,),
                  backgroundColor: Colors.purpleAccent,
                  radius: 30,
                ),
                SizedBox(width: 10),
                Text("In Progress", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.check_circle, color: Colors.white,),
                  backgroundColor: Colors.green,
                  radius: 30,
                ),
                SizedBox(width: 10),
                Text("Done", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ],
            ),
          ),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Text("Active Projects", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
          ),
          Container(),
        ],
      ),
    );
  }
}

