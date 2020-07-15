import 'package:flutter/material.dart';


class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          Expanded(
            child: SliverAppBar(
              backgroundColor: Colors.orange,
              
              expandedHeight: 200,
              floating: true,
              pinned: true,
              flexibleSpace:FlexibleSpaceBar(
                title: Text("Title"),
                centerTitle: true,
              ),
              leading: IconButton(
                onPressed: (){},
                icon: Icon(Icons.menu),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search), 
                  onPressed: (){}
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}