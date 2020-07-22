import 'package:flutter/material.dart';
import 'package:my_tasks/Pages/Tasks/todo.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //gives total height and width of the device
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: size.height * .10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Icon(Icons.menu), Icon(Icons.search)],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  color: Colors.orange[300]),
            ),
          ),
          // SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("My Tasks",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.calendar_today),
                )
              ],
            ),
          ),
          // SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.redAccent[100],
                  child: Icon(
                    Icons.av_timer,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "To Do",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          // SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.blue[100],
                  child: Icon(
                    Icons.cloud_circle,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "In Progress",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          // SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.green[300],
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Done",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          // SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Text(
              "Active Projects",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, 
              childAspectRatio: .85,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: <Widget>[
                CategoryCard(
                  title: "Medical app",
                ),
                CategoryCard(
                  title: "Medical app",
                ),
                CategoryCard(
                  title: "Medical app",
                ),
                CategoryCard(
                  title: "Medical app",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {

  final String title; //for title can do same for image
  const CategoryCard({
    Key key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [BoxShadow(
          offset: Offset(0, 17),
          blurRadius: 17,
          spreadRadius: -23,
          // color: kShadowColor
        )]
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget> [
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.yellow,
                  onPressed: null),
                Spacer(),
                Text(
                  title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 20),
                ),
                
              ]
            ),
          ),
        ),
      ),
    );
  }
}
